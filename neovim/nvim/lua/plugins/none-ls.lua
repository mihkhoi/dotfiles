local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local ast_grep = helpers.make_builtin({
	name = "ast_grep",
	method = methods.internal.DIAGNOSTICS,
	filetypes = {
		"c",
		"cpp",
		"go",
		"java",
		"js",
		"ts",
		"tsx",
		"jsx",
		"lua",
		"python",
		"ruby",
		"rust",
		"swift",
		"kotlin",
		"scala",
		"elixir",
		"html",
		"css",
		"json",
		"toml",
		"yaml",
	},
	generator_opts = {
		command = "sg",
		args = { "run", "--json", "--pattern", "TODO", "$FILENAME" }, -- hoặc --config nếu có .sgconfig
		to_stdin = false,
		format = "json",
		on_output = function(params)
			local diagnostics = {}
			for _, match in ipairs(params.output or {}) do
				table.insert(diagnostics, {
					row = match.start.line,
					col = match.start.column,
					end_row = match["end"].line,
					end_col = match["end"].column,
					source = "ast-grep",
					message = match.message or "sg match",
					severity = 2,
				})
			end
			return diagnostics
		end,
	},
	factory = helpers.generator_factory,
})

-- Tạo augroup để quản lý autocmd
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- Chọn các công cụ formatter (có thể thêm stylua, prettier, black...)
	sources = {
		null_ls.builtins.formatting.clang_format.with({
			extra_args = {
				"--assume-filename",
				"C:/Users/lolme/AppData/Local/nvim/lua/config/format/.clang-format",
			},
		}),
		null_ls.builtins.formatting.stylua,
		ast_grep,
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
