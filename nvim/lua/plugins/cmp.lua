vim.g.completeopt = "menu,menuone,noselect,noinsert"

local installed, Cmp = pcall(require, "cmp")
if not installed then
	vim.notify("Plugin 'nvim-cmp' is not installed")
	return
end

local installed, LspKind = pcall(require, "lspkind")
if not installed then
	vim.notify("Plugin 'lspkind' is not installed")
	return
end

local installed, LuaSnip = pcall(require, "luasnip")
if not installed then
	vim.notify("Plugin 'LuaSnip' is not installed")
	return
end

Cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      LuaSnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  window = {
    completion = Cmp.config.window.bordered(),
    documentation = Cmp.config.window.bordered(),
  },

  mapping = Cmp.mapping.preset.insert({
    ["<C-b>"] = Cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = Cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = Cmp.mapping.complete(),
    ["<C-e>"] = Cmp.mapping.abort(),
    -- ["<CR>"] = Cmp.mapping.confirm({ select = false }),
    -- ["<C-CR>"] = Cmp.mapping.confirm({ select = true }),
    ['<CR>'] = Cmp.mapping(function(fallback)
        if Cmp.visible() then
            if LuaSnip.expandable() then
                LuaSnip.expand()
            else
                Cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),
    ["<C-Tab>"] = Cmp.mapping(function(fallback)
      if Cmp.visible() then
        Cmp.select_next_item()
      elseif LuaSnip.locally_jumpable(1) then
        LuaSnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = Cmp.mapping(function(fallback)
      if Cmp.visible() then
        Cmp.select_prev_item()
      elseif LuaSnip.locally_jumpable(-1) then
        LuaSnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }), -- end of mapping section

  -- Managing Sources for completions
  sources = Cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
  }, { { name = "buffer" } }),

  formatting = {
    format = LspKind.cmp_format({ with_text = true, maxwidth = 50 }),
  },
})

-- filetypes
Cmp.setup.filetype("gitcommit", {
	sources = Cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline({ "/", "?" }, {
	mapping = Cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline(":", {
	mapping = Cmp.mapping.preset.cmdline({
    ['<Down>'] = { c = Cmp.mapping.select_next_item({ behavior = Cmp.SelectBehavior.Insert }) },
    ['<Up>'] = { c = Cmp.mapping.select_prev_item({ behavior = Cmp.SelectBehavior.Insert }) },
  }),
	sources = Cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
