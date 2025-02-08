-- requring plugin
local installed, Guard = pcall(require, "guard.filetype")
if not installed then
  vim.notify("Plugin 'guard' is not installed")
  return
end

-- setting up
ft = require("guard.filetype")

-- ft('typescript,javascript,typescriptreact'):fmt('prettier'):lint('eslint')
ft('typescript,javascript,typescriptreact'):fmt('prettier')
ft('python'):fmt('black'):lint('flake8')
ft('go'):fmt('gofmt')

vim.g.guard_config = {
  fmt_on_save = false,
  lsp_as_default_formatter = true,
}
