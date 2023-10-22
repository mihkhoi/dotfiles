local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>rr", ":LspRestart<CR>", opts)

map("n", "<leader>ss", ":LspStart<CR>", opts)

--map("n", "<leader>fm", "<cmd> vim.lsp.buf.formatting()<CR>", opts)

--vim.o.guifont = "Hack NF:h13"
--vim.o.guifont = "JetBrainsMono Nerd Font"

local M = {}

--M.nvterm = {
--  plugin = true,
--
--  t = {
--    -- toggle in terminal mode
--    ["<A-i>"] = {
--      function()
--        require("nvterm.terminal").toggle "float"
--      end,
--      "Toggle floating term",
--    },
--
--    ["<A-h>"] = {
--      function()
--        require("nvterm.terminal").toggle "horizontal"
--      end,
--      "Toggle horizontal term",
--    },
--
--    ["<A-v>"] = {
--      function()
--        require("nvterm.terminal").toggle "vertical"
--      end,
--      "Toggle vertical term",
--    },
--  },
--
--  n = {
--    -- toggle in normal mode
--    ["<A-i>"] = {
--      function()
--        require("nvterm.terminal").toggle "float"
--      end,
--      "Toggle floating term",
--    },
--
--    ["<A-h>"] = {
--      function()
--        require("nvterm.terminal").toggle "horizontal"
--      end,
--      "Toggle horizontal term",
--    },
--
--    ["<A-v>"] = {
--      function()
--        require("nvterm.terminal").toggle "vertical"
--      end,
--      "Toggle vertical term",
--    },
--
--    -- new
--    ["<leader>h"] = {
--      function()
--        require("nvterm.terminal").new "horizontal"
--      end,
--      "New horizontal term",
--    },
--
--    ["<leader>v"] = {
--      function()
--        require("nvterm.terminal").new "vertical"
--      end,
--      "New vertical term",
--    },
--  },
--}

return M
