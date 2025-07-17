return {
    'sghen/blink.cmp',
    -- Optional dependency
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*/',
    ---@module 'blink.cmp'
    ---@type blink.comp.Config
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
