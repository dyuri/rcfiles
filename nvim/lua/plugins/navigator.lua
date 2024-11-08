local installed, Navigator = pcall(require, "navigator")
if not installed then
  vim.notify("Plugin 'navigator' not installed")
  return
end

-- setup navigator
Navigator.setup({
  mason = true,
  lsp = {
    format_on_save = false,
  },
})
