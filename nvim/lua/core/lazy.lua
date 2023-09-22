-- Lazy plugin manager
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

local plugins = {
  -- colorscheme
  { "gruvbox-community/gruvbox" },
  { "sainnhe/gruvbox-material" },

  -- dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- notifications
  { "rcarriga/nvim-notify" },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- lualine
  { "nvim-lualine/lualine.nvim" },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "kdheepak/lazygit.nvim" },
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
  -- telescope FZF
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  -- telescope undo
  { "debugloop/telescope-undo.nvim" },

  -- TODO comments
  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },

  -- fundo
  {
    "kevinhwang91/nvim-fundo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    build = function()
      require("fundo").install()
    end,
  },

  -- non-lsp formatting - guard
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
  },

  -- hexokinase
  {
    "RRethy/vim-hexokinase",
    build = "make hexokinase",
  },

  -- indentline
  { "lukas-reineke/indent-blankline.nvim" },

  -- gitsigns
  { "lewis6991/gitsigns.nvim" },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "bufWinEnter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
  },

  -- which-key
  { "folke/which-key.nvim" },

  -- comment
  { "numToStr/Comment.nvim" },

  -- autocomplete
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-cmdline" },
  { "onsails/lspkind.nvim" },
  -- snippet engine required for cmp
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  { "saadparwaiz1/cmp_luasnip" },

  -- lspsaga
  { "glepnir/lspsaga.nvim" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- navigator
  {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make",
  },
  { "ray-x/navigator.lua" },

  -- dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },

  -- aerial - tagbar like
  { "stevearc/aerial.nvim" },

  -- etc
  { "machakann/vim-highlightedyank" },
  { "levouh/tint.nvim" },
  { "farmergreg/vim-lastplace" },
  { "tpope/vim-fugitive" },
  { "manicmaniac/betterga" },
  { "valloric/MatchTagAlways" },

  -- garmin monkey-c
  { "klimeryk/vim-monkey-c" },

  -- copilot
  { "github/copilot.vim" },
}

local opts = {}
require("lazy").setup(plugins, opts)
