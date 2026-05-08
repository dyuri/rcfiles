-- requiring necessary plugins
-- mason
local installed, Mason = pcall(require, "mason")
if not installed then
  vim.notify("Plugin 'mason' not installed ")
  return
end

-- Mason lspconfig
local installed, MasonLspConfig = pcall(require, "mason-lspconfig")
if not installed then
  vim.notify("Plugin 'mason-lspconfig' not installed ")
  return
end

-- Mason nvim dap
local installed, MasonNvimDap = pcall(require, "mason-nvim-dap")
if not installed then
  vim.notify("Plugin 'mason-nvim-dap' not installed ")
  return
end

-- Mason tool installer
local installed, MasonToolInstaller = pcall(require, "mason-tool-installer")
if not installed then
  vim.notify("Plugin 'mason-tool-installer' not installed ")
  return
end

-- cmp_nvim_lsp
local installed, CmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if not installed then
  vim.notify("Plugin 'cmp_nvim_lsp' not installed ")
  return
end

-- dap ui
local installed, DapUI = pcall(require, "dapui")
if not installed then
  vim.notify("Plugin 'dapui' not installed ")
  return
end

-- --- --
-- setup

Mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

MasonLspConfig.setup({
  ensure_installed = {
    "cssls",
    "marksman",
  },
})

MasonNvimDap.setup({
  ensure_installed = {
    "python",
  },
  handlers = {}, -- sets up dap in the predefined manner
})

MasonToolInstaller.setup({
  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = {
    -- you can turn off/on auto_update per tool
    { "bash-language-server" },
    { "lua-language-server" },
    { "vim-language-server" },
    { "stylua" },
    { "editorconfig-checker" },
    { "html-lsp" },
    { "css-lsp" },
    { "pyright" },
    { "black" },
    { "autopep8" },
    { "json-lsp" },
    { "prettier" },
    { "typescript-language-server" },
    { "js-debug-adapter" },
    { "eslint_d" },
    { "eslint-lsp" },
  },

  auto_update = false,
  run_on_start = true,
  start_delay = 3000, -- 3 second delay
  debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- --- --
-- individual LSP setups

local capabilities = CmpNvimLsp.default_capabilities()

-- pyright
vim.lsp.config["pyright"] = {
  capabilities = capabilities,
}
vim.lsp.enable("pyright")

-- ts + js
vim.lsp.config["jsonls"] = {
  capabilities = capabilities,
}
vim.lsp.config["ts_ls"] = {
  capabilities = capabilities,
}
vim.lsp.config["eslint"] = {
  capabilities = capabilities,
}
vim.lsp.enable("jsonls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")

-- html
vim.lsp.config["html"] = {
  capabilities = capabilities,
}
vim.lsp.enable("html")

-- CSS LS
vim.lsp.config["cssls"] = {
  capabilities = capabilities,
}
vim.lsp.enable("cssls")

-- golang
vim.lsp.config["gopls"] = {
  capabilities = capabilities,
}
vim.lsp.enable("gopls")

-- we need to convert the above part to the new api


-- DAPUI
DapUI.setup()

-- autoformat
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
