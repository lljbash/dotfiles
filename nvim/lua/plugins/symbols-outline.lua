return {
  -- 基于 LSP/treesitter 的 symbol outline
  {
    "stevearc/aerial.nvim",
    dependencies = { "folke/which-key.nvim" }, -- for easier key-binding
    event = "VeryLazy",
    config = function()
      local aerial = require("aerial")
      aerial.setup({
        backends = { "lsp", "treesitter", "markdown", "man" },
        -- filter_kind = false, -- display all symbols
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Namespace",
          "Struct",
        },
        autojump = true,
        lsp = {
          priority = {
            marksman = -1,
          },
        },
      })

      -- hide cursor when entering aerial
      local augroup = vim.api.nvim_create_augroup("aerial", {})
      vim.api.nvim_create_autocmd({ "WinEnter", "WinNew" }, {
        group = augroup,
        callback = function(opts)
          local ft = vim.bo[opts.buf].filetype
          if ft == "aerial" then
            vim.cmd("hi Cursor blend=100")
          end
        end,
      })
      vim.api.nvim_create_autocmd("WinLeave", {
        group = augroup,
        callback = function(opts)
          local ft = vim.bo[opts.buf].filetype
          if ft == "aerial" then
            vim.cmd("hi Cursor blend=0")
          end
        end,
      })

      -- keybindings
      require("which-key").add({
        { "<Leader>o", aerial.toggle, desc = "Open/focus symbol outline" },
        { "[s", aerial.prev, desc = "Previous symbol" },
        { "]s", aerial.next, desc = "Next symbol" },
        { "<Space>s", function() require("aerial").snacks_picker() end, desc = "Symbols" },
      })
    end,
  },
}
