local installed, Tint = pcall(require, "tint")
if not installed then
	vim.notify("Plugin 'tint' not installed")
	return
end

Tint.setup()
