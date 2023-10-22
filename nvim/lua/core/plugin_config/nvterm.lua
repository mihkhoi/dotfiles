--vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
--vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
--vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
--vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
--vim.opt.shellquote = ""
--vim.opt.shellxquote = ""
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.04,
        col = 0.29,
        width = 0.7,
        height = 0.7,
        border = "rounded",
      },
      horizontal = { location = "rightbelow", split_ratio = .6,7 },
      vertical = { location = "rightbelow", split_ratio = .6,7 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
})

local toggle_modes = {'n', 't'}
local mappings = {
  { 'n', '<C-l>', function () require("nvterm.terminal").send(ft_cmds[vim.bo.filetype]) end },
  { toggle_modes, '<leader>te', function () require("nvterm.terminal").toggle('horizontal') end },
  { toggle_modes, '<leader>tt', function () require("nvterm.terminal").toggle('vertical') end },
  { toggle_modes, '<leader>tr', function () require("nvterm.terminal").toggle('float') end },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
