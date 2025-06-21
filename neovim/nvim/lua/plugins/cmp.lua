local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show symbol + text
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name] or ""
        return vim_item
      end,
    }),
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<S-n>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        vim.wait(500, function()
          return cmp.visible()
        end)
        cmp.select_next_item()
      end
    end,
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "neorg" },
    { name = "buffer" },
    { name = "path" },
  }),
})
