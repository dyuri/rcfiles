vim.cmd([[highlight IndentBlanklineIndent1 guifg=#642d00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#7d3901 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#974401 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#b05001 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#ca5b01 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#e36701 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#fb4934 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#b8bb26 gui=nocombine]])

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
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
	},
	max_indent_increase = 1,
	strict_tabs = true,
})
