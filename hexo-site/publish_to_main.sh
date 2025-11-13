#!/usr/bin/env bash
set -e

# 发布脚本：在 source 分支执行，将生成内容同步到 main 分支根目录
# 使用方式：
#   bash hexo-site/publish_to_main.sh
# 需要：当前分支为 source，已安装 hexo 依赖。

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "source" ]; then
  echo "请在 source 分支执行，当前为: $CURRENT_BRANCH" >&2
  exit 1
fi

WORKDIR="$(cd "$(dirname "$0")" && pwd)"
cd "$WORKDIR"

echo "[1/5] 清理并生成静态文件"
npx hexo clean && npx hexo generate

echo "[2/5] 切换到 main 分支"
git checkout main

echo "[3/5] 复制 public 到根目录 (保持 README 不被覆盖)"
rsync -av --delete --exclude README.md "$WORKDIR/public/" ./

echo "[4/5] 提交与推送"
git add .
git commit -m "chore: publish from hexo source $(date +%Y-%m-%d)" || echo "无变更可提交"
git push origin main

echo "[5/5] 返回 source 分支继续写作"
git checkout source

echo "发布完成。"
