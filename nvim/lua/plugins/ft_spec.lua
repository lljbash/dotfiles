--- 特定语言使用的插件
return {
  -- Justfile
  { "NoahTheDuke/vim-just", ft = "just" },

  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {},
  },
}
