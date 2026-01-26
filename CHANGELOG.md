# Changelog

## [1.12.0](https://github.com/sleiphir/nvim/compare/v1.11.0...v1.12.0) (2026-01-26)


### Features

* add git diff keymaps ([13fafde](https://github.com/sleiphir/nvim/commit/13fafde824e362d793fd9c4837324a88c43a31d1))
* add merge conflict keybindings ([061ddf7](https://github.com/sleiphir/nvim/commit/061ddf7584eb0e877cf03147ec9a5404838d8ddb))
* **conform:** add terraform fmt ([5ca4f0e](https://github.com/sleiphir/nvim/commit/5ca4f0ef5b9ce30344ee11af8fa7d78ea98207c6))
* replace trouble plugin with vim.diagnostic ([ecfa9a3](https://github.com/sleiphir/nvim/commit/ecfa9a363acab1bb05a052652d14a6ecbcc1ee3a))


### Bug Fixes

* **conform:** use proper formatters and add jsx/tsx support ([e0c2406](https://github.com/sleiphir/nvim/commit/e0c24068b27b89964e61cbf7c0bb4823accfef24))
* **fugitive:** disable lsp in diff buffers ([1b29559](https://github.com/sleiphir/nvim/commit/1b295597f4eb0567b2a80c8d04cd622d2fba38e7))

## [1.11.0](https://github.com/sleiphir/nvim/compare/v1.10.0...v1.11.0) (2026-01-06)


### Features

* add custom keymaps for supermaven ([ced1dc1](https://github.com/sleiphir/nvim/commit/ced1dc1397e41a9e83bba9778721f6a7b8b71a1e))
* add jsonls lsp ([6010546](https://github.com/sleiphir/nvim/commit/6010546517bed297f8737608868f19c35ac35956))
* add new colorschemes ([374fe0c](https://github.com/sleiphir/nvim/commit/374fe0c585a28771d7ebf2356f10a8fdef23727b))
* add nvim-dap for debugging ([4da5013](https://github.com/sleiphir/nvim/commit/4da501359d82c69cfcbc9ca9ed1e51c2a5e89ad2))
* add supermaven ([f8ab09b](https://github.com/sleiphir/nvim/commit/f8ab09ba881180e9babbf34c38d8129c68d5ceb5))
* add tailwindcss lsp config ([e46d052](https://github.com/sleiphir/nvim/commit/e46d052cb286f4b1c1527053c049a96fd0efe789))
* add yamlls lsp ([cd43fb1](https://github.com/sleiphir/nvim/commit/cd43fb110ffd3cb4b9c94137152a29ffa61d6005))
* **conform:** add additional configs ([a9222a5](https://github.com/sleiphir/nvim/commit/a9222a57f795c36145e3c08cf5aaf767c1023ca9))
* **lsp:** add dockerls and docker_compose_language_service ([5dafced](https://github.com/sleiphir/nvim/commit/5dafced30ee2f20ffe545c309d576e478689887c))
* **lsp:** add html-lsp + update conform config ([6cb0473](https://github.com/sleiphir/nvim/commit/6cb047320f087e4b8f64d35b2c56d3b1eff9e1da))
* **lsp:** add prismals ([4c98909](https://github.com/sleiphir/nvim/commit/4c989092b4426814d312b0af9de150107e36c9cb))
* **lsp:** disable inlay hints ([40a5297](https://github.com/sleiphir/nvim/commit/40a52978a9eec19510424c70280046c63a2ec721))
* **lsp:** update lspconfig, add root lsp directory ([6340aae](https://github.com/sleiphir/nvim/commit/6340aae11b48ad20d625f29a33af3cfcba6e0f8c))
* modify LSPs to prefer conform for formatting ([6efd8a3](https://github.com/sleiphir/nvim/commit/6efd8a3873e435c09b5a4fbfc806c667e634df9f))
* **plugins:** add nvim-tree ([7739a48](https://github.com/sleiphir/nvim/commit/7739a4878b75204128af9e3d79dc16b006942605))
* **supermaven:** add on-demand autocompletion ([977f625](https://github.com/sleiphir/nvim/commit/977f625e5dec9beaa15a6eea0c5398eaca95ee82))
* **telescope:** add g/ to search all project files ([401d3af](https://github.com/sleiphir/nvim/commit/401d3aff990900bf44e4392912cb5a938a27276c))

## [1.10.0](https://github.com/sleiphir/nvim/compare/v1.9.0...v1.10.0) (2025-03-07)


### Features

* add &lt;leader&gt;q to open the Go scratchpad (Only for Go files) ([3ed7615](https://github.com/sleiphir/nvim/commit/3ed7615c2b3f9be1b5c3f260147fcfe97eb7bafd))
* add back autocmd insert mode on terminal open ([2d64865](https://github.com/sleiphir/nvim/commit/2d648650d0a2724d12a5dad5d299ee9c4b7bcbae))
* add typescript lsp w/ volar ([146291c](https://github.com/sleiphir/nvim/commit/146291ce3be010eca4c4ba1932525c0415b82f01))
* add vim-bujo ([7c9a5b2](https://github.com/sleiphir/nvim/commit/7c9a5b2a9fa443c2db35bed5c915f03076a66b9f))
* enhance typescript configuration ([b700549](https://github.com/sleiphir/nvim/commit/b700549bf3f55df6aff984340505c8d7ce87a07b))
* **lsp:** add &lt;leader&gt;<CR> to run `go main %` (only for Go files) ([dba90a9](https://github.com/sleiphir/nvim/commit/dba90a94cf466f71cacb367720768b14b3cadd88))
* **telescope:** add `&lt;leader&gt;fm` keybinding for treesitter builtin ([756b357](https://github.com/sleiphir/nvim/commit/756b357e2bffa7a14ed1402991fd4dd50b6b222b))
* **vim-bujo:** add git repo for ~/.cache/bujo and commit & push on save ([ff60086](https://github.com/sleiphir/nvim/commit/ff600866dc287e5eda5d4903ac5871e791ecbdb8))

## [1.9.0](https://github.com/sleiphir/nvim/compare/v1.8.0...v1.9.0) (2024-12-06)


### Features

* add lazydev.nvim ([3c4da35](https://github.com/sleiphir/nvim/commit/3c4da351e5d4e1c5ebc8f195ffe5989de1c82614))
* add ray-x/go.nvim ([4a3419e](https://github.com/sleiphir/nvim/commit/4a3419e02e6ea99aaf49984be75d44cb2b2ed785))
* remove lazygit ([ecef385](https://github.com/sleiphir/nvim/commit/ecef385c0a202b9a39d9a5ba7f698af997c9fec7))


### Bug Fixes

* **cmp:** formatting using lspkind ([2c087db](https://github.com/sleiphir/nvim/commit/2c087db1a77227c4aa0400fea8053c803a1d8ebe))

## [1.8.0](https://github.com/sleiphir/nvim/compare/v1.7.0...v1.8.0) (2024-11-11)


### Features

* add snippet support ([1cf7767](https://github.com/sleiphir/nvim/commit/1cf776744d2bb98d45c491bc8ae2cda8e4f85294))


### Bug Fixes

* **lualine:** use better command for parsing branch name ([85a92af](https://github.com/sleiphir/nvim/commit/85a92af06006ccb443b5d4807f323e27e28e0328))
* use lsp_signature as a standalone plugin ([4cb2047](https://github.com/sleiphir/nvim/commit/4cb2047971ad58dcb1960e78c320835e34df1afb))

## [1.7.0](https://github.com/sleiphir/nvim/compare/v1.6.0...v1.7.0) (2024-11-11)


### Features

* add lualine.lua ([de7a7f6](https://github.com/sleiphir/nvim/commit/de7a7f655e0c9883f2f1b4705d33de2710dd5365))
* add new colorschemes ([0e06ebe](https://github.com/sleiphir/nvim/commit/0e06ebe5ce26aae34f07c4d6132be75a2af6f61d))
* avante.nvim ([bd6e432](https://github.com/sleiphir/nvim/commit/bd6e432b15293c30bc81049430715a43570a9857))
* cleanup config ([4fabec4](https://github.com/sleiphir/nvim/commit/4fabec4249cb95dfebe6a0ad0a1e01aca094a1e9))
* **lsp:** add golang autocmd on save ([8c2f01f](https://github.com/sleiphir/nvim/commit/8c2f01f9da92b4be79b38977fb1f2f71888cacac))
* **ui:** add dressing.nvim ([1e6b9b6](https://github.com/sleiphir/nvim/commit/1e6b9b6b3b990ff388681eaa4b05287456b72c2f))

## [1.6.0](https://github.com/sleiphir/nvim/compare/v1.5.0...v1.6.0) (2024-09-30)


### Features

* add &lt;leader&gt;d to duplicate line ([b474945](https://github.com/sleiphir/nvim/commit/b47494563df56123609db1071d40b7db250846f3))
* add colorizer plugin for hex codes ([fceb4c3](https://github.com/sleiphir/nvim/commit/fceb4c35c6ed8f142fca9a8afc2771a8330e8160))
* add indent-blankline ([f556257](https://github.com/sleiphir/nvim/commit/f556257710b5f093a470c28da696a92309162695))
* **coding:** add supermaven autocompletion ([754eef1](https://github.com/sleiphir/nvim/commit/754eef18b9ea88b3b50fee47c41c5375ef272403))

## [1.5.0](https://github.com/sleiphir/nvim/compare/v1.4.0...v1.5.0) (2024-07-28)


### Features

* **telescope:** change &lt;leader&gt;fa to ignore .git folder ([77272a7](https://github.com/sleiphir/nvim/commit/77272a70d3fb1ab439585e68d58c55c80baebf1f))

## [1.4.0](https://github.com/sleiphir/nvim/compare/v1.3.0...v1.4.0) (2024-07-06)


### Features

* add oil to replace netrw ([7e318ed](https://github.com/sleiphir/nvim/commit/7e318ed9166d2f5a76149ec6785d93ee63395ea2))
* add python path to options ([f019253](https://github.com/sleiphir/nvim/commit/f019253e4a4bd9d46b11ce1c0060f739d303d96a))
* disable copilot for now ([7e318ed](https://github.com/sleiphir/nvim/commit/7e318ed9166d2f5a76149ec6785d93ee63395ea2))

## [1.3.0](https://github.com/sleiphir/nvim/compare/v1.2.0...v1.3.0) (2024-04-20)


### Features

* remove guicursor option ([c1fc0ca](https://github.com/sleiphir/nvim/commit/c1fc0cad117cf6710e90201bcd117ad2717b28ec))
* remove unused bindings ([105d6cf](https://github.com/sleiphir/nvim/commit/105d6cf2eab4cf8e7f736dab6054113f290b2d36))

## [1.2.0](https://github.com/sleiphir/nvim/compare/v1.1.0...v1.2.0) (2024-04-19)


### Features

* **autocmds:** add lsp auto format on save ([cbe86de](https://github.com/sleiphir/nvim/commit/cbe86ded28b899087a6d3b1891d3d8d755d6c614))

## [1.1.0](https://github.com/sleiphir/nvim/compare/v1.0.2...v1.1.0) (2024-04-19)


### Features

* add custom theme 'peel-enhanced' ([3fd3e0b](https://github.com/sleiphir/nvim/commit/3fd3e0b6bfa7e9bb9d0ce9fa2f35d25ffe0e10a6))
* **plugin:** add folke/trouble plugin ([98e3528](https://github.com/sleiphir/nvim/commit/98e35282d410dbe42365b5927d841fe23a274b0b))
* remove fleet theme config file ([87b5717](https://github.com/sleiphir/nvim/commit/87b571752a2f99e4951edd8b2c146ad5ddb41f81))

## [1.0.2](https://github.com/sleiphir/nvim/compare/v1.0.1...v1.0.2) (2023-11-30)


### Bug Fixes

* **coding:** add back luaSnip ([1f1dbf0](https://github.com/sleiphir/nvim/commit/1f1dbf06c67824107598bcce9c4802f97da08536))

## [1.0.1](https://github.com/sleiphir/nvim/compare/v1.0.0...v1.0.1) (2023-11-27)


### Bug Fixes

* **fugitive:** allow fugitive to load when no files are opened ([b969172](https://github.com/sleiphir/nvim/commit/b969172234b77b06bc35c8f3ceb0319ad07ac4ca))

## 1.0.0 (2023-11-26)

### Features

* **lazy:** Rewrite config using lazy.nvim package manager
