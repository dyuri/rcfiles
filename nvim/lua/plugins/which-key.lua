local installed, wk = pcall(require, "which-key")
if not installed then
  vim.notify("Plugin 'which-key' is not installed")
  return
end

-- leader mappings
local leader_mappings = {
  { "<leader>a", ":AerialToggle!<CR>", desc = "Aerial" },
  { "<leader>e", ":NvimTreeToggle<CR>", desc = "File Explorer" },
  { "<leader>v", "V`]", desc = "Reselect pasted" },

  { "<leader>d", group = "DAP" },
  { "<leader>dO", ":lua require'dap'.step_out()<cr>", desc = "Step out" },
  { "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
  { "<leader>dc", ":lua require'dap'.continue()<cr>", desc = "Continue" },
  { "<leader>di", ":lua require'dap'.step_into()<cr>", desc = "Step into" },
  { "<leader>do", ":lua require'dap'.step_over()<cr>", desc = "Step over" },
  { "<leader>dr", ":lua require'dap'.repl.toggle()<cr>", desc = "Toggle REPL" },
  { "<leader>ds", ":lua require'dap'.stop()<cr>", desc = "Stop" },
  { "<leader>du", ":lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
  { "<leader>dx", ":lua require'dap'.terminate()<cr>", desc = "Terminate" },

  { "<leader>f", group = "Format" },
  { "<leader>ff", ":lua vim.lsp.buf.format({ async = true })<cr>", desc = "LSP format" },
  { "<leader>fg", ":GuardFmt<cr>", desc = "Guard format" },

  { "<leader>l", group = "LSP" },
  { "<leader>lc", ":Lspsaga code_action<cr>", desc = "Code action" },
  { "<leader>ld", ":lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
  { "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
  { "<leader>ln", ":lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostic" },
  { "<leader>lp", ":lua vim.diagnostic.goto_prev()<cr>", desc = "Previous diagnostic" },
  { "<leader>lr", ":lua vim.lsp.buf.references()<cr>", desc = "References" },
  { "<leader>ls", ":lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic" },

  { "<leader>s", group = "Telescope" },
  { "<leader>sT", ":TodoTelescope<cr>", desc = "TODO" },
  { "<leader>sb", ":Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>sc", ":Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer" },
  { "<leader>sd", ":Telescope diagnostics<cr>", desc = "Diagnostic" },
  { "<leader>sf", ":Telescope find_files<cr>", desc = "Find files" },
  { "<leader>sg", ":Telescope live_grep<cr>", desc = "Live grep" },
  { "<leader>so", ":Telescope oldfiles<cr>", desc = "Old files" },
  { "<leader>st", ":Telescope treesitter<cr>", desc = "Treesitter" },
}

local copilot = {
  {
    mode = { "n", "v" },
    { "<leader>cc", group = "Copilot Chat" },
    { "<leader>ccR", ":CopilotChatRefactor<cr>", desc = "Refactor" },
    { "<leader>cce", ":CopilotChatExplain<cr>", desc = "Explain" },
    { "<leader>ccr", ":CopilotChatReview<cr>", desc = "Review" },
    { "<leader>cct", ":CopilotChatTests<cr>", desc = "Generate Test" },
    { "<leader>ccx", ":CopilotChatInPlace<cr>", desc = "Chat in-place" },
  },
}

wk.add(leader_mappings)
wk.add(copilot)
