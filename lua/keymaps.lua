-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
map('i', 'jk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', default_opts)

-- custom mappings
map('n', '<leader>t', ':tabnew<CR>', default_opts)
map('n', '<leader>rt', ':+tabmove<CR>', default_opts)
map('n', '<leader>rT', ':-tabmove<CR>', default_opts)

--map('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true})
map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true})
map('n', '<leader>em', ':vsplit ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true})
map('n', '<leader>ep', ':vsplit ~/.config/nvim/lua/plugins/packer.lua<CR>', { noremap = true})

map('n', '<leader>s', ':FZF!<CR>', default_opts)
map('i', '<leader>s', '<ESC>:FZF!', default_opts)
map('v', '<leader>s', '<ESC>:FZF!', default_opts)
map('n', '<leader>l', ':Buffers<CR>', default_opts)


map('n', '<leader>rg', ':Rg!<cr>', default_opts)

map('n', '<leader>gl', ':Git log -p -- % <CR>', default_opts)


map('n', '<leader>so', ':OpenSession!<Space>', { noremap = true})
map('n', '<leader>ss', ':SaveSession!<Space>', { noremap = true})

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close

function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_set_keymap('n', '<leader>sv', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
vim.cmd('command! ReloadConfig lua ReloadConfig()')
