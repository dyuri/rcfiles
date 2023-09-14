local installed, GitSigns = pcall(require, "gitsigns")
if not installed then
  vim.notify("Plugin 'gitsigns.nvim' is not installed")
  return
end

GitSigns.setup({
  current_line_blame = true,
})
