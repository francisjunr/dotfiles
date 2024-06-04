-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",

  -- Bufferline and delete buffer using Bdelete
  -- "akinsho/bufferline.nvim",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- navigaete between vim and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- automatically close an open bracket
  { "windwp/nvim-autopairs",  opts = {} },
  -- automatically close and rename tags
  { "windwp/nvim-ts-autotag", opts = {} },

  -- show problems in code in a window below
  -- "folke/trouble.nvim",

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },
  { -- null ls is for code formatting and linting
    "jose-elias-alvarez/null-ls.nvim",
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  },

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim",          opts = {} },

  -- {
  --   -- Colorscheme
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   -- config = function()
  --   --   vim.cmd.colorscheme("tokyonight-night")
  --   -- end,
  -- },
  --
  -- {
  --   -- Colorscheme
  --   "navarasu/onedark.nvim",
  --   oopts = {
  --     style = "darker",
  --   },
  --   priority = 1000,
  --   -- config = function()
  --   --   vim.cmd.colorscheme("onedark")
  --   -- end,
  -- },
  {
    -- Colorscheme
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",

  -- Add indentation guides even on blank lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { enabled = false },
      indent = { char = "┊" },
    },
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim",         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  },

  -- add fancy icons support
  -- { "kyazdani42/nvim-web-devicons", opts = {} },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    -- dependencies = {
    --   "nvim-tree/nvim-web-devicons",
    -- },
  },

  -- configurable terminal windoW
  "akinsho/toggleterm.nvim",
}, {
  -- get rid of the icons in the lazy menu (:Lazy)
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },
})
