-- Filetypes to disable treesitter highlighting (fallback to vim regex syntax)
local hl_disable = { "cmake", "git_rebase", "gitcommit" }

return {
  -- Tree-sitter parser manager (auto-install on file open)
  {
    "arborist-ts/arborist.nvim",
    lazy = false,
    init = function()
      -- Use treesitter to fold code
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldlevel = 99 -- Open all folds by default
    end,
    config = function()
      require("arborist").setup({ install_popular = true })

      local group = vim.api.nvim_create_augroup("treesitter_hl", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          if not vim.tbl_contains(hl_disable, vim.bo[args.buf].filetype) then
            pcall(vim.treesitter.start, args.buf)
            vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
          end
        end,
      })
    end,
  },

  -- Virtual text context for neovim treesitter
  {
    "andersevenrud/nvim_context_vt",
    opts = {
      prefix = "",
      highlight = "LspInlayHint",
      min_rows_ft = {
        python = 50,
      },
    },
  },
}
