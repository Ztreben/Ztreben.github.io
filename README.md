# 我的学习博客（静态站点）

本仓库为个人学习记录（算法 / 深度学习 / 技术笔记）。已在基础 Hexo 生成结构上做了以下增强：

## 已改进特性
- 中文本地化与 SEO 元信息（`lang`, `description`, OpenGraph, Twitter Card）。
- 响应式导航：首页 / 归档 / 标签（占位）。
- 暗色 / 亮色主题切换（基于 CSS 变量 + `data-theme`）。
- 更简洁的排版：优化行高、字号、内容背景对比度。
- 代码高亮：引入 highlight.js CDN（可改为本地离线）。
- 更清晰的页脚与版权信息。

## 目录结构说明
```
index.html              # 首页（文章列表/最新文章）
2025/11/13/hello-world/ # 示例文章目录
archives/               # 归档索引
css/style.css           # 全局样式（含主题变量）
js/script.js            # 站点交互脚本（搜索 / 图片灯箱 / 移动导航）
fancybox/               # 图片灯箱资源
```

## 新增文章流程（手动模式）
1. 按日期创建目录：`YYYY/MM/DD/slug/`。
2. 在目录下新增 `index.html`，可拷贝 `hello-world` 作为模板。
3. 填写：标题、时间 `<time datetime="YYYY-MM-DD">YYYY-MM-DD</time>`、正文内容、代码片段使用 `<pre><code class="language-python">...</code></pre>` 让 highlight.js 自动高亮。
4. 首页或归档如需手动更新，可在 `index.html` / `archives/index.html` 添加对应链接（若使用 Hexo 正常生成则自动处理）。

## 暗色主题说明
- 根元素 `<html>` 带 `data-theme="light|dark"`。
- 用户点击切换按钮后写入 `localStorage.theme`，刷新后仍保留选择。
- 可在 `style.css` 中调整 `:root` 与 `[data-theme="dark"]` 变量来自定义颜色。

## 自定义代码高亮
- 当前使用：`github-dark` 主题。
- 替换方案：在 `<head>` 中将 highlight.js 样式链接换成其它主题文件。
- 如需本地化：下载对应 CSS & JS 文件放入 `js/` 与 `css/` 目录并修改引用路径。

## 性能与可维护建议
- 图片：建议压缩后放入 `images/`，并给 `<img>` 添加 `alt` 描述。
- 延迟加载：若文章图片较多，可后续添加 `loading="lazy"`。
- Tag/分类：后续可引入生成脚本，根据 front-matter 结构自动汇总。

## 可选后续增强
- 搜索：引入本地 JSON 索引（lunr.js 或 elasticlunr）。
- PWA：添加 `manifest.json` 与 Service Worker 离线缓存。
- 访问统计：添加简单统计脚本（不侵犯隐私的前提下）。
- 自定义域名：根目录已有 `CNAME` 可配置独立域名。

## 手动构建/部署（若继续用 Hexo）
```bash
# 写作
hexo new "post-title"
# 生成
hexo generate
# 本地预览
hexo server
# 部署（需配置 deploy）
hexo deploy
```

## 版权与用途
仅用于个人学习记录，不做商业用途。如需引用他人文章内容请保留来源链接。

---
如果你希望我再批量更新文章模板或添加标签页，请在 issue 或对话中继续说明。
