local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
            --mode = 'symbol',
			with_text = true, -- do not show text alongside icons
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
                --vim_item.kind = 'kind'
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
			end,
		}),
	},
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {
		["<S-n>"] = cmp.mapping.select_prev_item(),
		--["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
        ['<C-n>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
            cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
            vim.wait(500, function()
              return cmp.visible()
            end)
            cmp.select_next_item()
          end
        end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "neorg" },
	},
})
