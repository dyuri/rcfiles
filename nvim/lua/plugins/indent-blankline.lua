vim.cmd([[highlight IndentBlanklineIndent1 guifg=#642d00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#644401 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#867726 gui=nocombine]])

local installed, IndentBlankLine = pcall(require, "indent_blankline")
if not installed then
  vim.notify("Plugin 'indent_blankline' is not installed")
  return
end

IndentBlankLine.setup({
  opts = {
    show_trailing_blankline_indent = false,
  },
  filetype_exclude = {
    "help",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "lazy",
    "lsp-installer",
    "termianl",
    "NvimTree",
    "mason",
  },

  buftype_exclude = { "terminal" },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  max_indent_increase = 1,
  strict_tabs = true,
})
