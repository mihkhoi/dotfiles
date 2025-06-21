require('nvim-treesitter.configs').setup({
    ensure_installed = { "vim", "lua" }, -- có thể thêm các ngôn ngữ khác như "cpp", "python", v.v.

    highlight = {
        enable = true,       -- bật highlight
        additional_vim_regex_highlighting = false, -- tắt highlight cũ của Vim
    },

    indent = {
        enable = true,       -- bật indent theo cú pháp
    },
})
