local installed, wk = pcall(require, "which-key")
if not installed then
	vim.notify("Plugin 'which-key' is not installed")
	return
end

-- leader mappings
local leader_mappings = {
  a = { ":AerialToggle!<CR>", "Aerial" },
  v = { "V`]", "Reselect pasted" },

  -- Telescope
  s = {
    name = "Telescope",
    f = { ":Telescope find_files<cr>", "Find files" },
    c = { ":Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
    o = { ":Telescope oldfiles<cr>", "Old files" },
    g = { ":Telescope live_grep<cr>", "Live grep" },
    b = { ":Telescope buffers<cr>", "Buffers" },
    t = { ":Telescope treesitter<cr>", "Treesitter" },
  },

  -- TODO add navigator related shortcuts
}
wk.register(leader_mappings, { prefix = "<leader>" })
