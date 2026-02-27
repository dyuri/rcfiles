-- Generic options
-- Appearance
vim.o.background = "dark"
vim.cmd("let g:gruvbox_material_palette = 'original'")
vim.cmd("let g:gruvbox_material_background = 'medium'")
vim.cmd("let g:gruvbox_contrast_dark = 'soft'")
vim.cmd([[colorscheme gruvbox-material]])
vim.opt.termguicolors = true
vim.o.pumheight = 10 -- popup menu
vim.o.cmdheight = 1  -- command menu

-- Files
vim.o.modifiable = true
vim.o.fileencoding = "utf-8" -- File Encoding
vim.g.loaded_netrw = 1       -- Helps opening links in the internet (probabilly -_-)
vim.g.loaded_netrwPlugin = 1
-- vim.opt.autochdir = true
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.title = true
vim.o.autoread = true
-- vim.o.digraph = true -- use ctrl+k for digraphs

-- Split Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Update and backups
local prefix = vim.env.XDG_CACHE_HOME or vim.fn.expand("~/backup")
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.directory = prefix .. "/nvim/swp//"
vim.o.undofile = true
vim.o.backupdir = prefix .. "/nvim/backup//"
vim.o.backup = true
vim.o.undodir = prefix .. "/nvim/undo//"
vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Clipboard
vim.o.clipboard = "unnamed,unnamedplus"

-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.highlight.on_yank()
--     local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
--     copy_to_unnamedplus(vim.v.event.regcontents)
--     local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
--     copy_to_unnamed(vim.v.event.regcontents)
--   end,
-- })

-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--   },
-- }

-- Backspace key
vim.o.backspace = "indent,eol,start"

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mouse and Scrolling
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.mouse = "nv"

-- Wrapping
vim.wo.wrap = true
vim.wo.number = false         -- F11
vim.wo.relativenumber = false -- F11
vim.o.cursorline = false      -- F12
vim.o.cursorcolumn = false    -- F12
vim.wo.signcolumn = "yes"
vim.o.startofline = false
vim.o.showmatch = true

-- Tabs and indentations
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.showtabline = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.breakindent = true
vim.o.smarttab = true

-- Statusline
vim.o.laststatus = 3
vim.o.ruler = true
vim.o.showcmd = true

-- Whitespaces
vim.opt.list = false
vim.opt.listchars = { tab = "▸ ", eol = "¬", trail = "⋅", extends = "❯", precedes = "❮", nbsp = "␣" }
vim.opt.showbreak = "↪"
vim.opt.fillchars = { eob = "-", fold = " " }

-- folding
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return "  [" .. line_count .. "] " .. line
end

vim.o.foldenable = false
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10
vim.o.foldmethod = "indent"
vim.o.foldtext = "v:lua.custom_fold_text()"

-- Nvim Notify
vim.notify = require("notify")

-- diff
vim.o.diffopt = "filler,internal,closeoff,algorithm:patience,indent-heuristic"

-- TODO session handling? https://github.com/rmagatti/auto-session
