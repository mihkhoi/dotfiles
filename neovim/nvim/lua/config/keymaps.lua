local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Resize panes
keymap("n", "<M-Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<M-Down>", ":resize +1<CR>", opts)
keymap("n", "<M-Up>", ":resize -1<CR>", opts)

-- Search highlighted text (visual mode)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)

-- Clear search highlight with <Esc>
keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Buffers and redo
keymap("n", "<S-w>", ":bd<CR>", opts) -- Close buffer
keymap("n", "<S-Tab>", ":bn<CR>", opts) -- Next buffer
keymap("n", "<S-u>", ":redo<CR>", opts) -- Redo

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Lsp
keymap("n", "<leader>rr", ":LspRestart<CR>", opts)

keymap("n", "<leader>ss", ":LspStart<CR>", opts)

-- Dap debug
keymap("n", "<leader>dc", ":DapContinue<CR>", opts)
keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>dn", ":DapStepOver<CR>", opts)
keymap("n", "<leader>di", ":DapStepInto<CR>", opts)
keymap("n", "<leader>do", ":DapStepOut<CR>", opts)
keymap("n", "<leader>dq", ":DapTerminate<CR>", opts)
keymap("n", "<leader>dl", ":DapClearBreakpoint<CR>", opts)
keymap("n", "<leader>dp", ":DapPause<CR>", opts)

-- Noice
keymap("n", "<leader>h", ":NoiceHistory<CR>", opts)
