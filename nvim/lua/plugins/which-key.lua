local installed, wk = pcall(require, "which-key")
if not installed then
  vim.notify("Plugin 'which-key' is not installed")
  return
end

-- leader mappings
local leader_mappings = {
  a = { ":AerialToggle!<CR>", "Aerial" },
  e = { ":NvimTreeToggle<CR>", "File Explorer" },
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
    T = { ":TodoTelescope<cr>", "TODO" },
  },

  -- DAP
  d = {
    name = "DAP",
    b = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
    c = { ":lua require'dap'.continue()<cr>", "Continue" },
    i = { ":lua require'dap'.step_into()<cr>", "Step into" },
    o = { ":lua require'dap'.step_over()<cr>", "Step over" },
    O = { ":lua require'dap'.step_out()<cr>", "Step out" },
    r = { ":lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
    s = { ":lua require'dap'.stop()<cr>", "Stop" },
    u = { ":lua require'dapui'.toggle()<cr>", "Toggle UI" },
    x = { ":lua require'dap'.terminate()<cr>", "Terminate" },
  },

  l = {
    name = "LSP",
    c = { ":Lspsaga code_action<cr>", "Code action" },
    f = { ":lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    d = { ":lua vim.lsp.buf.definition()<cr>", "Definition" },
    r = { ":lua vim.lsp.buf.references()<cr>", "References" },
  },
}
wk.register(leader_mappings, { prefix = "<leader>" })
