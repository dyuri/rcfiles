local installed, TreeSitter = pcall(require, "nvim-treesitter")
if not installed then
  vim.notify("Plugin 'treesitter' is not installed")
  return
end

-- Setting up Treesitter
TreeSitter.install {
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
}
