local sidebar_filetypes = {
  "sidekick_terminal",
  "aerial",
  "aerial-nav",
}

return {
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<C-s>", "<cmd>AutoSession search<CR>", desc = "Session search" },
    },
    init = function()
      vim.o.sessionoptions =
        "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
          local cur_win = vim.api.nvim_get_current_win()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if win ~= cur_win then
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.tbl_contains(sidebar_filetypes, vim.bo[buf].filetype) then
                vim.api.nvim_win_close(win, true)
              end
            end
          end
        end,
      })
    end,
    opts = {
      post_restore_cmds = {
        function()
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[bufnr].buftype == "" then
              vim.fn.bufload(bufnr)
            end
          end
        end,
      },
      load_on_setup = true,
      close_filetypes_on_save = vim.list_extend({ "checkhealth" }, sidebar_filetypes),
      session_lens = {
        picker = "snacks",
        load_on_setup = true,
      },
    },
  },
}
