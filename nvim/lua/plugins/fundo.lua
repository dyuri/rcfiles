local installed, Fundo = pcall(require, "fundo")
if not installed then
  vim.notify("Plugin 'fundo' not installed ")
  return
end

Fundo.setup()
