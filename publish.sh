#!/usr/bin/env bash
set -euo pipefail

# 安全发布脚本 (Hexo 源在 source 分支, 静态站点在 main 分支)
# 原理：使用 git worktree 创建 main 分支的单独工作目录，避免破坏当前仓库 .git。
# 步骤：生成 -> 创建工作树 -> 清理旧静态文件 -> 拷贝新 public -> 提交推送 -> 移除工作树。
# 运行前提：当前所在分支必须是 source，并且 hexo-site 已初始化、安装依赖。
# 使用方式：
#   chmod +x publish.sh
#   ./publish.sh
# 可选参数：
#   --no-clean   跳过 hexo clean（加速）
#   --message "自定义提交信息"

DEFAULT_MESSAGE="chore: publish static site $(date +%Y-%m-%d)"
CLEAN=1
COMMIT_MESSAGE="$DEFAULT_MESSAGE"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-clean)
      CLEAN=0; shift;;
    --message)
      COMMIT_MESSAGE="$2"; shift 2;;
    *) echo "未知参数: $1"; exit 1;;
  esac
done

# 1. 基本校验
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "错误：当前目录不是 Git 仓库" >&2; exit 1; fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT_BRANCH" != "source" ]]; then
  echo "错误：请在 source 分支运行，当前为 $CURRENT_BRANCH" >&2; exit 1; fi

HEXO_DIR="hexo-site"
if [[ ! -d "$HEXO_DIR" ]]; then
  echo "错误：缺少 $HEXO_DIR 目录" >&2; exit 1; fi
if [[ ! -f "$HEXO_DIR/package.json" ]]; then
  echo "错误：$HEXO_DIR 缺少 package.json，可能未初始化" >&2; exit 1; fi

echo "[1/7] 生成静态文件 (Hexo)"
pushd "$HEXO_DIR" >/dev/null
if [[ $CLEAN -eq 1 ]]; then
  npx hexo clean
fi
npx hexo generate
PUBLIC_DIR="$PWD/public"
if [[ ! -d "$PUBLIC_DIR" ]]; then
  echo "错误：未生成 public 目录" >&2; exit 1; fi
popd >/dev/null

echo "[2/7] 准备 main 分支工作树"
WORKTREE_DIR=".deploy-main"
if git worktree list | awk '{print $1}' | grep -qx "$WORKTREE_DIR"; then
  echo "已有工作树，移除旧的：$WORKTREE_DIR"
  git worktree remove "$WORKTREE_DIR" --force || true
fi

# 确保 main 分支存在远程
git fetch origin main || true
if ! git show-ref --verify --quiet refs/heads/main; then
  echo "本地不存在 main，创建空分支";
  git branch main origin/main || git branch main || true
fi

git worktree add "$WORKTREE_DIR" main

echo "[3/7] 清理工作树静态文件 (保留 README.md / CNAME / .git)"
pushd "$WORKTREE_DIR" >/dev/null
for item in * .*; do
  case "$item" in
    .|..|.git|README.md|CNAME) continue;;
    *) rm -rf "$item";;
  esac
done

echo "[4/7] 拷贝新生成内容"
cp -R "../$HEXO_DIR/public/." .

echo "[5/7] 提交与推送 main 分支"
git add .
if git diff --cached --quiet; then
  echo "无变化，跳过提交。"
else
  git commit -m "$COMMIT_MESSAGE"
  git push origin main
fi
popd >/dev/null

echo "[6/7] 移除工作树 (保持 main 分支更新)"
git worktree remove "$WORKTREE_DIR" || true

echo "[7/7] 发布完成。当前仍在 source 分支，可继续写作。"
echo "如需跳过 clean 加速：./publish.sh --no-clean"
echo "自定义提交信息：./publish.sh --message 'feat: 更新文章'"
