local installed, TodoComments = pcall(require, "todo-comments")
if not installed then
  vim.notify("Plugin 'todo-comments' is not installed")
  return
end

TodoComments.setup({
  highlight = {
    pattern = [[.*<(KEYWORDS)\s*]],
  },
  search = {
    pattern = [[\b(KEYWORDS)]],
  },
})
