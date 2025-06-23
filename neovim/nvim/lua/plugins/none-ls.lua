local null_ls = require("null-ls")

-- Tạo augroup để quản lý autocmd
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- Chọn các công cụ formatter (có thể thêm stylua, prettier, black...)
	sources = {
		null_ls.builtins.formatting.clang_format.with({
			extra_args = {
				"--assume-filename",
				"C:/Users/lolme/AppData/Local/nvim/lua/format/.clang-format",
			},
		}),
		null_ls.builtins.formatting.stylua,
	},

	-- Format khi lưu (nếu LSP hỗ trợ và là null-ls)
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						async = false,
						-- Chỉ dùng null-ls để format
						filter = function(format_client)
							return format_client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
