return {
    'sghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.comp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<M-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        },

        appearance = {
            nerd_font_variant = 'normal',
        },

        completion = {
            menu = {
                auto_show = true,
                border = 'single',
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                draw = {
                    columns = {
                        { 'label', 'label_description', 'source_name', gap = 1 },
                        { 'kind_icon', 'kind' },
                    },
                },
            },
            documentation = {
                --auto_show = true,
                --auto_show_delay_ms = 500,
                window = {
                    border = 'single',
                },
            },
        },

        signature = {
            enabled = true,
            window = {
                border = 'single',
            },
        },

        sources = {
            --default = { 'lsp', 'path', 'snippets', 'buffer' },
            default = { 'lsp', 'path', 'snippets' },
        },

        fuzzy = {
            implementation = 'prefer_rust_with_warning',
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },

        signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
}
