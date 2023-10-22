local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>rr", ":LspRestart<CR>", opts)

map("n", "<leader>ss", ":LspStart<CR>", opts)

map("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)

map("n", "<leader>dr", ":DapContinue<CR>", opts)
--map("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)
