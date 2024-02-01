local installed, TreeSitter = pcall(require, "nvim-treesitter.configs")
if not installed then
  vim.notify("Plugin 'treesitter' is not installed")
  return
end
-- Setting up Treesitter
TreeSitter.setup({
  ensure_installed = {
    "c",
    "go",
    "lua",
    "vim",
    "vimdoc",
    "html",
    "css",
    "javascript",
    "typescript",
    "python",
    "markdown",
    "markdown_inline",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = false,
    enable_close_on_slash = false,
  },
})

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
