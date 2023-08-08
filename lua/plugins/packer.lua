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
packer.startup(function()

-- alpha for splash screen and menu
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

-- setup pack manager for development languages
  use {
       "williamboman/mason.nvim",
       run = ":MasonUpdate"
  }

  -- 'for tabs reorder'
  use 'romgrk/barbar.nvim'

  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use 'windwp/nvim-autopairs'

  -- tagviewer
  -- use 'liuchengxu/vista.vim'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- colorschemes
  -- use 'tanvirtin/monokai.nvim'
  -- use { 'rose-pine/neovim', as = 'rose-pine' }
  use "olimorris/onedarkpro.nvim"
  use "EdenEast/nightfox.nvim"

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Snippets
  use 'mattn/emmet-vim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  -- statusline
  use {
      "nvim-lualine/lualine.nvim",
      requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  -- git labels
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     require('gitsigns').setup()
  --   end,
  -- }
  use {
     "tpope/vim-fugitive"
  }
  -- use {
  --    "nathom/filetype.nvim"
  -- }
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
  use "jose-elias-alvarez/typescript.nvim"

  use "terrortylor/nvim-comment"

  -- icons
  use 'nvim-tree/nvim-web-devicons'
  use 'tpope/vim-rhubarb'
  use 'onsails/lspkind-nvim'

  -- Go
  use('nvim-lua/plenary.nvim')
  use('crispgm/nvim-go')

end)

require("mason").setup()

