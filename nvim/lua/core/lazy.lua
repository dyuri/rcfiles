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
  -- { "gruvbox-community/gruvbox" },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, },
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
  -- telescope ui-select
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
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
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

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
  { "echasnovski/mini.icons" },
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
  { "williamboman/mason.nvim", version = "^1.0.0" },
  { "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- navigator
  { "ray-x/guihua.lua" },
  { "ray-x/navigator.lua" },

  -- quicker - quickfix improvements
  {
    'stevearc/quicker.nvim',
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },

  -- dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
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
  { "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        default_to_projects_v2 = true,
      })
    end,
  },

  -- garmin monkey-c
  { "klimeryk/vim-monkey-c" },

  -- hunk diff
  {
    "julienvincent/hunk.nvim",
    cmd = { "DiffEditor" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("hunk").setup()
    end,
  },

  -- jj-diffconflicts
  { "rafikdraoui/jj-diffconflicts" },

  -- markdown
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('render-markdown').setup({})
    end,
  },

  -- copilot
  { "github/copilot.vim" },
  { "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    opts = {
      model = 'gpt-4.1',
      temperature = 0.2,
      window = {
        layout = 'vertical',
        width = 0.5,
      },
      auto_insert_mode = true,
    },
  },

  -- opencode
  {
    'NickvanDyke/opencode.nvim',
    dependencies = { 'folke/snacks.nvim', },
    opts = {},
    -- keys = {
    --   { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
    --   { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
    --   { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
    --   { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
    --   { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
    --   { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
    --   { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
    --   { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
    -- },
  },
}

local opts = {}
require("lazy").setup(plugins, opts)
