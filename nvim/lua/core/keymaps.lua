vim.g.mapleader = " "

-- Function keys
vim.keymap.set("i", "<F1>", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("v", "<F1>", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<F2>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F3>", ":bp!<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<F4>", ":bn!<CR>", { noremap = true, silent = false })
vim.keymap.set("i", "<F3>", "<ESC>:bp!<CR>a", { noremap = true, silent = false })
vim.keymap.set("i", "<F4>", "<ESC>:bn!<CR>a", { noremap = true, silent = false })
vim.keymap.set("n", "<F5>", ":Telescope undo<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-F7>", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F19>", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F8>", ":Telescope oldfiles<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", ":AerialToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-F9>", ":Telescope treesitter<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F21>", ":Telescope treesitter<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F11>", ":set nu!<CR>:set relativenumber!<CR>:set list!<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<S-F11>", ":set wrap!<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<F23>", ":set wrap!<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<F12>", ":set cursorcolumn!<CR>:set cursorline!<CR>", { noremap = true, silent = false })

-- Indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = false })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = false })

-- Clear selection / notification
vim.keymap.set("n", "<leader><space>", ":noh<CR>:lua require('notify').dismiss()<CR>", { noremap = true, silent = true })

-- Map neovim's copy back to vim's
vim.keymap.set("n", "Y", "yy", { noremap = true, silent = false })

-- BS: fold
vim.keymap.set("n", "<Backspace>", "za", { noremap = true, silent = false })

-- cursor movement in wrapped lines
vim.keymap.set("n", "<DOWN>", function()
  if vim.v.count == 0 then return 'gj' end
  return 'j'
end, { noremap = true, silent = false, expr = true })
vim.keymap.set("n", "<UP>", function()
  if vim.v.count == 0 then return 'gk' end
  return 'k'
end, { noremap = true, silent = false, expr = true })

-- dvorak Q => :
vim.keymap.set("n", "Q", ":", { noremap = true, silent = false })

-- window navigation
vim.keymap.set("n", "<C-UP>", "<C-W><UP>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-DOWN>", "<C-W><DOWN>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-LEFT>", "<C-W><LEFT>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-RIGHT>", "<C-W><RIGHT>", { noremap = true, silent = false })

-- capital command -- abbreviations not yet supported TODO
-- vim.keymap.set("ca", "Q", "q")
-- vim.keymap.set("ca", "W", "w")
-- vim.keymap.set("ca", "Q!", "q!")
-- vim.keymap.set("ca", "W!", "w!")
-- vim.keymap.set("ca", "WQ", "wq")
-- vim.keymap.set("ca", "Wq", "wq")
-- vim.keymap.set("ca", "wQ", "wq")

