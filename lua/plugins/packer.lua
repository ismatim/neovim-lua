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

-- python


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
  -- use 'romgrk/barbar.nvim'

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
  -- use({ 'stevedylandev/flexoki-nvim', as = 'flexoki' })

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
  -- use('nvim-lua/plenary.nvim')
  -- use('crispgm/nvim-go')
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- python
  use 'tell-k/vim-autopep8'
  use 'williamboman/mason-lspconfig.nvim'
  use 'WhoIsSethDaniel/mason-tool-installer.nvim'

  use 'github/copilot.vim'


end)

require("mason").setup()
require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'lua_ls',
        'jsonls',
        'lemminx',
        'marksman',
        'quick_lint_js',
        'yamlls',
        'pyright',
      }
})
require('mason-tool-installer').setup {

  -- a list of all tools you want to ensure are installed upon
  -- start
  ensure_installed = {

    -- you can pin a tool to a particular version
    { 'golangci-lint', version = 'v1.47.0' },

    -- you can turn off/on auto_update per tool
    { 'bash-language-server', auto_update = true },

    'lua-language-server',
    'vim-language-server',
    'gopls',
    'stylua',
    'shellcheck',
    'editorconfig-checker',
    'gofumpt',
    'golines',
    'gomodifytags',
    'gotests',
    'impl',
    'json-to-struct',
    'luacheck',
    'misspell',
    'revive',
    'shellcheck',
    'shfmt',
    'staticcheck',
    'pyright',
    'vint',
    'black',
    'debugpy',
    'flake8',
    'isort',
    'mypy',
    'pylint',
  },

  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated. This setting does not
  -- affect :MasonToolsUpdate or :MasonToolsInstall.
  -- Default: false
  auto_update = false,

  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,

  -- set a delay (in ms) before the installation starts. This is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- Default: 0
  start_delay = 3000, -- 3 second delay

  -- Only attempt to install if 'debounce_hours' number of hours has
  -- elapsed since the last time Neovim was started. This stores a
  -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
  -- This is only relevant when you are using 'run_on_start'. It has no
  -- effect when running manually via ':MasonToolsInstall' etc....
  -- Default: nil
  debounce_hours = 5, -- at least 5 hours between attempts to install/update
}


