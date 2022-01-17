-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use 'windwp/nvim-autopairs'

  -- tagviewer
  use 'liuchengxu/vista.vim'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- colorschemes
  use 'tanvirtin/monokai.nvim'

  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Snippets
  use 'mattn/emmet-vim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
  use {
     "tpope/vim-fugitive"
  }
  use {
     "tpope/vim-obsession"
  }
  use {
     "nathom/filetype.nvim"
  }
  use {
     "tpope/vim-dadbod"
  }
  use {
    "tpope/vim-surround"
  }
  use {
     "kristijanhusak/vim-dadbod-ui"
  }
  use {
    "kristijanhusak/vim-dadbod-completion"
  }
  use {
    "junegunn/fzf"
  }
  use {
    "junegunn/fzf.vim"
  }
  use {
    "mileszs/ack.vim"
  }
  use {
    "mhinz/vim-grepper"
  }
  use {
    "norcalli/nvim-colorizer.lua"
  }
  use "mhartington/formatter.nvim"
  -- Typescript
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "terrortylor/nvim-comment"
  -- icons
  use 'kyazdani42/nvim-web-devicons'

  use 'tpope/vim-rhubarb'
  use 'onsails/lspkind-nvim'

end)


