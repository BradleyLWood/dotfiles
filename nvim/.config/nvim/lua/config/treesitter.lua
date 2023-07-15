require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "erlang",
        "fish",
        "go",
        "graphql",
        "haskell",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "php",
        "python",
        "regex",
        "rust",
        "scss",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
    },

    sync_install = false,
    ignore_install = {},

    indent = {
        enable = true
    },

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = { enable = true },

    textobjects = { enable = true }
}

--vim.opt.foldtext = 'v:lua.custom_fold_text()'
--vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--function _G.custom_fold_text()
--    local line = vim.fn.getline(vim.v.foldstart)
--    local line_count = vim.v.foldend - vim.v.foldstart + 1
--    return " ⚡ " .. line .. ": " .. line_count .. " lines"
--end
