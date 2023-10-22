--local null_ls = require("null-ls")
--
--local opts = {
--    sources = {
--        null_ls.builtins.formatting.clang_format,
--    },
--    on_attach = function (client, bufnr)
--        if clinet.supports_method("textDocument/formatting") then
--            vim.api.nvim_clear_autocmds({
--                group = augroup,
--                buffer = bufnr,
--            })
--        vim.api.nvim_create_autocmd("BufWritePre", {
--            group = augroup,
--            buffer = bufnr,
--            callback = function()
--                vim.lsp.buf.format({bufnr = bufnr})
--            end,
--        })
--        end
--    end,
--}
--return opts
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.shfmt, -- shell script formatting
    require("null-ls").builtins.formatting.clang_format, -- markdown formatting
    require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
    require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions
  },
})
