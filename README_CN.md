<p align="center">
  <img src="./assets/logo_ppt-from-zero_horizontal_20260827.svg" alt="PPT From Zero" width="720" />
</p>

<p align="center">
  <a href="./LICENSE">MIT 许可证</a> ·
  <a href="https://github.com/hugohe3/ppt-master">PPT Master</a> ·
  <a href="https://hugohe3.github.io/ppt-master-examples/">在线示例</a> ·
  <a href="./README.md">English</a>
</p>

# PPT From Zero

`ppt-from-zero` 是一套 source-first 的演示文稿工作流 Skill，面向具备 Agent 能力的 AI 工具。它可以把 PDF、DOCX、网页、提纲、图片和数据整理成有事实依据的页面蓝图，再交给原生演示文稿构建器完成生成，并逐页检查最终渲染结果。

它不是第二套 PowerPoint 生成器，而是编排层：[`ppt-master`](https://github.com/hugohe3/ppt-master) 负责原生 PPTX 构建，`ppt-from-zero` 负责沟通契约、事实台账、页面蓝图、统一视觉系统、素材来源和发布前验收。

![工作流](./assets/diagram_ppt-from-zero_workflow_20260827.svg)

## 它补上的环节

| 阶段 | 产出 | 价值 |
| --- | --- | --- |
| 沟通契约 | 受众结果和叙事弧线 | 每页只有一个任务 |
| 事实台账 | 主张、数字、限定条件、来源和缺失证据 | 不编造事实，不伪造数据 |
| 页面蓝图 | 每页内容、结构、视觉、来源类型和备注 | 先讲清楚，再设计 |
| 统一视觉系统 | 调色板、字体角色、网格、图片、图表和 Logo 规则 | 页面相关但不机械重复 |
| 构建路由 | 原生 PPT Master，或明确的 HTML 派生 + 原生双分支 | 诚实呈现可编辑性取舍 |
| 发布验收 | 逐页渲染、溢出检查、备注和 OpenXML 验证 | 被检查的就是最终交付文件 |

## 示例

下面是配套示例仓库中的真实渲染结果。点击截图可打开在线 viewer。

| 编辑型建筑杂志 | 数据新闻 | 瑞士网格 |
| --- | --- | --- |
| [![Pritzker 2026](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_pritzker_2026.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_pritzker_2026) | [![Global AI Capital](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_global_ai_capital.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_global_ai_capital_2026) | [![Swiss grid](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_swiss_grid.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_swiss_grid_systems) |

更多参考：[全部示例](https://hugohe3.github.io/ppt-master-examples/)、[示例源仓库](https://github.com/hugohe3/ppt-master-examples)、[PPT Master 产品定位](https://github.com/hugohe3/ppt-master/blob/main/docs/zh/why-ppt-master.md)。

## 安装和调用

安装独立的 Skill 包，然后让 Agent 读取：

```bash
npx skills add chenyuanheng0127-netizen/ppt-from-zero
```

```text
SKILL.md
```

原生分支依赖 [`ppt-master`](https://github.com/hugohe3/ppt-master)。如果明确要求 HTML 派生分支，请安装已验证的 `dom-to-pptx`，并设置：

```bash
export PPT_FROM_ZERO_DOM_TO_PPTX="/absolute/path/to/dom-to-pptx"
# 或
export DOM_TO_PPTX_BIN="/absolute/path/to/dom-to-pptx"
```

然后在聊天中提出请求：

```text
使用 $ppt-from-zero，把 projects/q3-report/sources/report.pdf 制作成 10 页演示文稿。
```

双分支示例：

```text
使用 $ppt-from-zero，从同一份材料生成 HTML 派生 PPTX 和 PPT Master 原生 PPTX，并比较它们的可编辑性与视觉还原度。
```

## 输出模式

- **普通模式：** 通过选定的原生构建器输出一份可编辑 PPTX。
- **HTML 派生 + 原生：** 输出一份静态 HTML、一份 `*_html_derived.pptx` 和一份 `*_pptmaster_native.pptx`，三者共享同一份事实台账和页面顺序。

HTML 派生分支可能把不支持的 CSS、图片、渐变和复杂 SVG 转成降级对象。Skill 要求明确说明这些限制，不能把它们描述成完全可编辑。

## 设计与来源规则

- 提纲负责事实，设计不能创造新的主张。
- 每页只有一个面向受众的沟通任务。
- Logo 只能使用来源文件或确定性的派生版本，不能生成、拉伸、旋转、加阴影或贴成白色方块。
- 图表必须有真实数字、单位、日期、基准和方法；缺失数字要呈现为明确的证据占位。
- 图片记录来源、版权状态、尺寸、裁切、焦点和页面用途。
- 最终 PPTX 必须逐页渲染并检查；源文件看起来正确不等于验收通过。

## 目录

```text
.
├── SKILL.md                         # 入口和不可妥协的边界
├── agents/openai.yaml               # UI 元数据与原创图标路径
├── assets/                          # 原创标识、字标和工作流图
├── references/                      # 来源、设计、双分支、转换器和 QA 指南
└── scripts/dom_to_pptx.sh           # 可迁移的转换器包装脚本
```

先读 [核心 Skill](./SKILL.md)，再根据当前分支读取对应参考：[来源到蓝图](./references/source-to-outline.md)、[设计与素材](./references/design-and-assets.md)、[PPT Master 构建](./references/pptmaster-build.md)、[HTML 转 PPT](./references/html-to-ppt-dual-output.md)、[QA 与发布](./references/qa-and-release.md)。

## 署名

由 [Hendrix Chen](https://github.com/chenyuanheng0127-netizen) 创建和维护。本 Skill 独立发布，并配合 [PPT Master](https://github.com/hugohe3/ppt-master) 的原生演示文稿工作流使用。`assets/` 中的图标和字标是项目原创设计，不是 PowerPoint、OpenAI、Anthropic 或任何厂商的官方 Logo。

README 中链接的成品截图和在线 viewer 来自使用 MIT 许可证的 [PPT Master](https://github.com/hugohe3/ppt-master) 与 [PPT Master Examples](https://github.com/hugohe3/ppt-master-examples) 项目，仅作为参考示例从上游仓库加载，本仓库没有打包或再发布这些截图。详见 [第三方声明](./THIRD_PARTY_NOTICES.md)。

## 许可证

本 Skill 使用 [MIT 许可证](./LICENSE) 发布。再发布时请保留版权和许可证声明。
