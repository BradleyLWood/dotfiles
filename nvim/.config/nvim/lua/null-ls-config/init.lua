local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    --null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettierd,
    --null_ls.builtins.code_actions.eslint_d,
    --null_ls.builtins.diagnostics.eslint_d,
    --null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.fish,
    --null_ls.builtins.formatting.fish_indent,
    --null_ls.builtins.formatting.stylua,
  },
})

