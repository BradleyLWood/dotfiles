---@diagnostic disable: undefined-global, undefined-doc-name
return {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        zen = { enabled = true },
    },
    keys = {
        { '<leader>sf', function() Snacks.picker.files() end, desc = 'Files' },
        { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help' },
        { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
        { '<leader>sb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
        { '<leader>sB', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
        --{ '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
        { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History' },
        { '<leader>:',  function() Snacks.picker.command_history() end, desc = 'Command History' },
        { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands' },
        { '<leader>n',  function() Snacks.picker.notifications() end, desc = 'Notification History' },
        { '<leader>sc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Config' },
        { '<leader>sr', function() Snacks.picker.recent() end, desc = 'Recent' },
        { '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },

        { '<leader>sd', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
        { '<leader>sD', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
        { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
        { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
        { 'gd',         function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
        { 'gD',         function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
        { 'gr',         function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
        { 'gI',         function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
        { 'gt',         function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto Type Definition' },

        { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
        { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps' },
        { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
        { '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List' },
        { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
        { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
        { '<leader>sp', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec' },
        { '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List' },
        { '<leader>sR', function() Snacks.picker.resume() end, desc = 'Resume' },
        { '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },

        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

        { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },

        { '<leader>z',  function() Snacks.zen() end, desc = 'Toggle Zen Mode' },
        { '<leader>Z',  function() Snacks.zen.zoom() end, desc = 'Toggle Zoom' },

        { '<leader>.',  function() Snacks.scratch() end, desc = 'Scratch Buffer' },
    }
}
