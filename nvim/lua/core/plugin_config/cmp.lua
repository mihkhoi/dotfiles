local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local kind = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
	formatting = {
--    format = function(entry, vim_item)
--      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--      vim_item.menu = ({
--        nvim_lsp = "[LSP]",
--        luasnip = "[Snippet]",
--        buffer = "[Buffer]",
--        path = "[Path]",
--      })[entry.source.name]
--      return vim_item
--    end,
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
--		["<Tab>"] = function(fallback)
--			if cmp.visible() then
--				cmp.select_next_item()
--			elseif luasnip.expand_or_jumpable() then
--				luasnip.expand_or_jump()
--			else
--				fallback()
--			end
--		end,
--		["<S-Tab>"] = function(fallback)
--			if cmp.visible() then
--				cmp.select_prev_item()
--			elseif luasnip.jumpable(-1) then
--				luasnip.jump(-1)
--			else
--				fallback()
--			end
--		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "neorg" },
	},
})
