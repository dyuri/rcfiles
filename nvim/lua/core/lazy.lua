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
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
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
  {
    "jellydn/CopilotChat.nvim",
    branch = "canary",   -- Will be merged to main branch when it's stable
    opts = {
      mode = "split",    -- newbuffer or split, default: newbuffer
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false,     -- Enable or disable debug mode
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      -- Those are available only on canary branch
      {
        "<leader>ccv",
        ":CopilotChatVsplitVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
    },
  },
}

local opts = {}
require("lazy").setup(plugins, opts)
