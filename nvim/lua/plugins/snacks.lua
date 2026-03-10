---@diagnostic disable: undefined-global
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- for icons
    },
    ---@type snacks.Config
    opts = {
      picker = {
        enabled = true,
        matcher = {
          frecency = true,
        },
        ---@type table<string, fun(...:any):any>
        actions = {
          sidekick_send = function(...)
            return require("sidekick.cli.picker.snacks").send(...)
          end,
        },
        win = {
          input = {
            keys = {
              ["<a-a>"] = {
                "sidekick_send",
                mode = { "n", "i" },
              },
            },
          },
        },
      },
    },
    keys = {
      { "<Space>", group = "Snacks Picker" },
      { "<Space><Space>", function() Snacks.picker() end, desc = "All Pickers" },
      { "<Space>n", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<Space>p", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<Space>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<Space>g", function() Snacks.picker.grep() end, desc = "Live Grep" },
      { "<Space>G", function() Snacks.picker.grep_buffers() end, desc = "Grep Buffers" },
      { "<Space>*", function() Snacks.picker.grep_word() end, desc = "Grep Word" },
      { "<Space>o", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<Space>c", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<Space>C", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<Space>j", function() Snacks.picker.jumps() end, desc = "Jump List" },
      { "<Space>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<Space>a", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<Space>m", function() Snacks.picker.explorer() end, desc = "File Explorer" },
      -- LSP
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
      { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto references" },
      { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
      { "go", function() Snacks.picker.lsp_outgoing_calls() end, desc = "Outgoing calls" },
      { "gh", function() Snacks.picker.lsp_incoming_calls() end, desc = "Incoming calls" },
      -- Yank
      { "<Space>y", function() Snacks.picker.yanky() end, desc = "Yank History" },
    },
  },
}