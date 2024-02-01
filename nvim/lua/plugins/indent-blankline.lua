vim.cmd([[highlight IndentBlanklineIndent1 guifg=#642d00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#644401 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#867726 gui=nocombine]])

local installed, IndentBlankLine = pcall(require, "ibl")
if not installed then
  vim.notify("Plugin 'indent_blankline' is not installed")
  return
end

local highlight = {
  "IndentBlanklineIndent1",
  "IndentBlanklineIndent2",
}

IndentBlankLine.setup({
  indent = {
    highlight = highlight,
  },
  scope = {
    highlight = "IndentBlanklineContextChar",
  },
})
