local utils = require('functions') 
local settings = require("user-conf") 

local cmd = vim.cmd
local api = vim.api

cmd([[packadd packer.nvim]])

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enabled = true,
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746

  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup({ 
  function(use)
    use({ "wbthomason/packer.nvim", opt = true })

    -- Speed up plugin loading
    use({'lewis6991/impatient.nvim'})

    use {
      "ahmedkhalf/project.nvim",
      config = utils.get_config('project')
    }

    -- Nvim CMP (completion popup)
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'f3fora/cmp-spell' },
      },
      config = utils.get_config("nvim-cmp")
    })

    -- Nvim dap
    use {
      "mfussenegger/nvim-dap",
      config = utils.get_config('dap')
    }

    -- Metals Scala
    use({
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
      config = utils.get_config('metals')
    })

    use {
      'theHamsta/nvim-dap-virtual-text',
      requires = {
        {'mfussenegger/nvim-dap'},
        {'nvim-treesitter/nvim-treesitter'}
      },
      config = utils.get_config('nvim-dap-virtual-text')
    }

    -- LSP Tree support for highlighting, and coloring documents
    use { 
      'nvim-treesitter/nvim-treesitter', 
      run = ':TSUpdate',
      config = utils.get_config('nvim-treesitter')
    }


    use { "nvim-treesitter/nvim-treesitter-textobjects" }

    -- Themes

    if settings.theme == "gruvbox" then
	    use {
	      "ellisonleao/gruvbox.nvim",
	      config = utils.get_config('gruvbox_theme')
	    }
    end

    -- Smooth scrolling
    use { 
      'karb94/neoscroll.nvim',
      config = utils.get_config('neoscroll')

    }

    -- Git
    use { 'airblade/vim-gitgutter' }

    -- Startup screen
    use {
        'goolord/alpha-nvim',
        config = utils.get_config('alpha-nvim')
    }
    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      event = "VimEnter",
      requires = { 
        {'kyazdani42/nvim-web-devicons', opt = true },
        {'nvim-treesitter/nvim-treesitter', opt = true }
      },
      config = utils.get_config('lualine'),
    }

    -- Tabs / Buffers
    use {
      'akinsho/bufferline.nvim', 
      tag = "v2.*", 
      requires = 'kyazdani42/nvim-web-devicons',
      config = utils.get_config('bufferline')
    }

    use { 'famiu/bufdelete.nvim' }

    -- Automatic closing brackets, parenthesis...
    use {
      "windwp/nvim-autopairs",
      config = utils.get_config('autopairs'),
      requires = { 
        {'hrsh7th/nvim-cmp', opt = false}
      }
    }

    -- Quickness tools
    use {
      "ur4ltz/surround.nvim",
      config = utils.get_config('surround')
    }

    use { 
      'terrortylor/nvim-comment',
      config = utils.get_config('comment')
    }

    use { 'tpope/vim-repeat' }

    use { 'rking/ag.vim' }

    -- neoclip
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        {'tami5/sqlite.lua', module = 'sqlite'},
        {'nvim-telescope/telescope.nvim', opt = true},
      },
      config = utils.get_config('neoclip')
    }

    -- easymotion
    use { 'Lokaltog/vim-easymotion' }

    -- easyclip
    use { 'svermeulen/vim-easyclip' }

    -- File icons
    use { 
      'kyazdani42/nvim-web-devicons',
      config = utils.get_config('nvim-web-devicons')
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-ui-select.nvim' },
        { "nvim-telescope/telescope-file-browser.nvim" },
        {'crispgm/telescope-heading.nvim'},
        {'nvim-telescope/telescope-fzy-native.nvim'}
      },
      config = utils.get_config('telescope')
    }
    -- Trouble
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = utils.get_config('trouble')
    }

    -- NvimTree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = utils.get_config('nvim-tree')
    }

    -- Nvim-Sidebar: Temporarily disabled due to being too immature
    -- use {
    --   'sidebar-nvim/sidebar.nvim',
    --   config = utils.get_config('sidebar'),
    --   requires = {
    --     { 'sidebar-nvim/sections-dap', requires = { "mfussenegger/nvim-dap" } }
    --   }
    -- }

    -- Completion symbols
    use { 'onsails/lspkind.nvim' }

    -- WhichKey
    use { 
      'folke/which-key.nvim',
      config = utils.get_config("which-key")
    }

    -- Blankline indicator
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = utils.get_config('indent-blankline')
    })

    -- TODOs
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = utils.get_config("todos"),
    })

    -- ToggleTerm
    use({
      "akinsho/toggleterm.nvim", 
      tag = 'v2.*', 
      config = utils.get_config("toggleterm"),
    })

  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
