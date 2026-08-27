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

`ppt-from-zero` 是一套面向具备 Agent 能力的 AI 工具的集成式 PPT 产出 Skill。它把 PDF、DOCX、网页、提纲、图片和数据整理成有事实依据、有品牌系统、可编辑的 PPTX，并经过页面蓝图和逐页渲染验收。

它是一条从原始材料到验收通过的完整产出路线。集成 Skill 栈分别负责来源、叙事、品牌、设计、图片、HTML、原生 PPTX 和 QA，再统一回到同一份事实台账、页面蓝图和视觉系统。 [`ppt-master`](https://github.com/hugohe3/ppt-master) 负责原生 PPTX 的导出实现，`ppt-from-zero` 负责围绕它完成整条生产流程。

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

## 集成 Skill 栈

以下 Skill 都是 `ppt-from-zero` 产出路线的一部分。它们是同一套工作流中的分工，不是互相竞争的 PPT 生成器；每次请求只加载需要的角色，并把建议统一收敛到同一份事实台账、页面蓝图和视觉权威中。

| 集成 Skill | 在 PPT 路线中的职责 | 触发时机 |
| --- | --- | --- |
| `ppt-master` | 原生 PPTX 构建、SVG 源文件、项目规格、导出和原生 postflight | 默认原生分支；用户明确点名时必须使用 |
| `presentations` | 面向受众的叙事、页面层级、备注、渲染、montage、溢出检查和最终验收 | 每次 PPTX 交付 |
| `brand` | Logo 变体、留白、光学对齐、品牌身份和素材一致性 | 有 Logo、机构、合作方或品牌时 |
| `design-system` | 颜色、字体、间距和复用页面语法的 primitive → semantic → component 令牌 | 多页共享视觉系统时 |
| `ui-ux-pro-max` | 字体搭配、对比度、图表选择、信息密度和可访问性 | 可读性、图表、表格和高密度页面 |
| `design-taste-frontend` / `taste-skill` | 反模板、构图变化、层级和反 AI 套路的视觉预检 | 新的高审美 deck 和视觉 QA |
| `design` | 更广义的艺术指导、自定义图标、图片主导构图和演示文稿视觉语言 | 需要定制视觉方向或图标时 |
| `slides` | 战略叙事、页面策略、设计令牌和图表型参考 | 叙事规划和策略型 deck |
| `imagegen` | 原创位图主视觉、质感和概念隐喻 | 只用于原创非事实图片，不能生成官方 Logo 或数据图表 |
| `stop-slop` | 在不改变事实和主张的前提下，清理机械的中文文案 | 可见中文文案需要润色时 |
| `beautiful-article` | 长材料的来源归一化和编辑规划，并负责 HTML 分支 | 材料很长/异构，或明确要求 HTML 派生输出时 |
| `dom-to-pptx` | 把固定 `.slide` HTML/CSS 页面转换为 HTML 派生 PPTX | 仅在明确的 HTML 派生分支中使用 |

### 路线图

```text
原始材料
    ↓
ppt-from-zero：沟通契约 → 事实台账 → 页面蓝图 → 统一视觉系统
    ├── 原生路线：ppt-master → 可编辑 PPTX → presentations QA
    └── 双分支路线：beautiful-article → 固定 HTML 页面 → dom-to-pptx → PPTX A
                    ppt-master → 原生 PPTX B
                    presentations 对比两份最终渲染
```

上面列出的辅助 Skill 会参与对应的决策，不会被通用模板悄悄替代，也不会互相改写对方负责的源文件。

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
