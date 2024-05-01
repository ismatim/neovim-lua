-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')
require('keymaps')
require('plugins/packer')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-autopairs')
require('plugins/lualine')
require('plugins/vista')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
--require('plugins/nvim-treesitter')
require('plugins/formatter')
require('plugins/nvim-comment')
require('plugins/colorizer')
require('my-snippets/init')

require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

