-- Git Mergetool
vim.g.mergetool_layout = 'mr'                     -- Layout: mixed + right diff
vim.g.mergetool_prefer_revision = 'local'         -- Ưu tiên revision phía local

-- Phím tắt bật/tắt Mergetool
vim.keymap.set("n", "<leader>mt", "<plug>(MergetoolToggle)", { silent = true })


-- GitGutter - hiển thị dấu thay đổi trong gutter (lề trái)
vim.g.gitgutter_sign_added    = '✚'               -- Dòng được thêm
vim.g.gitgutter_sign_modified = '✹'               -- Dòng bị sửa
vim.g.gitgutter_sign_removed  = '✖'               -- Dòng bị xoá
-- vim.g.gitgutter_sign_removed_first_line = '^'
-- vim.g.gitgutter_sign_modified_removed   = '<'

vim.g.gitgutter_preview_win_floating = 1          -- Bật cửa sổ preview dạng nổi (floating)
