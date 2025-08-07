return {
    {
        'stevearc/conform.nvim',
        lazy = false,
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format({ async = true, lsp_fallback = true })
                end,
                mode = '',
                desc = 'Format buffer',
            },
        },
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                lua = { 'stylua' },
                go = { 'gofmt' },
                clojure = { 'cljfmt' },
                rust = { 'rustfmt', lsp_format = 'fallback' },
                ocaml = { 'ocamlformat' },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
            },
            formatters = {
                ocamlformat = {
                    prepend_args = {
                        '--if-then-else',
                        'vertical',
                        '--break-cases',
                        'fit-or-vertical',
                        '--type-decl',
                        'sparse',
                    },
                },
            },
        },
    },
}
