-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- interface
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- file navigation
    -- Fuzzy Finder (files, lsp, etc)
  use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      cond = vim.fn.executable 'make' == 1
  }

  use({'nvim-treesitter/nvim-treesitter',
      run = function()
          pcall(require('nvim-treesitter.install').update { with_sync = true })
      end
  })
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'


  -- undo history
  use 'mbbill/undotree'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
          -- Useful status updates for LSP
          {'j-hui/fidget.nvim'},

          -- Additional lua configuration, makes nvim stuff amazing
          {'folke/neodev.nvim'},
	  }
  }

  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines


  -- language specific configs
  -- Go
  use {'fatih/vim-go',  run = ':GoUpdateBinaries' }

  -- themes
  use {
	  'tanvirtin/monokai.nvim',
	  config = function()
		  vim.cmd('syntax on')
		  vim.cmd('colorscheme monokai')
	  end
  }

end)

