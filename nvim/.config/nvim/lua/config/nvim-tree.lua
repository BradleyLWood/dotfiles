local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local nvim_tree = require'nvim-tree'

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings

  -- remove mappings
  vim.keymap.set('n', 's', '', { buffer = bufnr })
  vim.keymap.del('n', 's', { buffer = bufnr })
end

nvim_tree.setup {
  sort_by = "case_sensitive",
  view = {
    width = 35,
  },
  on_attach = my_on_attach,
}
