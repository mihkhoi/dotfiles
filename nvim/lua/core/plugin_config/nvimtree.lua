require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort = {
    sorter = "name",
    folders_first = true,
  },
  root_dirs = {},
  prefer_startup_root = true,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  on_attach = "default",
  select_prompts = true,
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    full_name = true,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
--      glyphs = {
--        default = "",
--        symlink = "",
--        bookmark = "󰆤",
--        modified = "●",
--        folder = {
--          arrow_closed = "",
--          arrow_open = "",
--          default = "",
--          open = "",
--          empty = "",
--          empty_open = "",
--          symlink = "",
--          symlink_open = "",
--        },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
            -- modified  = "✹",
            -- staged    = "✚",
            -- untracked = "✭",
            -- renamed   = "➜",
            -- unmerged  = "═",
            -- deleted   = "✖",
            -- dirty     = "✗",
            -- ignored   = "☒",
            -- clean     = "✔︎",
            -- unknown   = "?",
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    git_ignored = true,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      eject = true,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
    absolute_path = true,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  experimental = {},
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
} -- END_DEFAULT_OPTS
-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
--
---- set termguicolors to enable highlight groups
--vim.opt.termguicolors = true
--
---- empty setup using defaults
--require("nvim-tree").setup()
--
---- OR setup with some options
--require("nvim-tree").setup({
--  filters = {
--    dotfiles = false,
--    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
--  },
--  disable_netrw = true,
--  hijack_netrw = true,
--  hijack_cursor = true,
--  hijack_unnamed_buffer_when_opening = false,
--  sync_root_with_cwd = true,
--  update_focused_file = {
--    enable = true,
--    update_root = false,
--  },
--  view = {
--    adaptive_size = false,
--    side = "left",
--    width = 30,
--    preserve_window_proportions = true,
--  },
--  git = {
--    enable = false,
--    ignore = true,
--  },
--  filesystem_watchers = {
--    enable = true,
--  },
--  actions = {
--    open_file = {
--      resize_window = true,
--    },
--  },
--  renderer = {
--    root_folder_label = true,
--    highlight_git = true,
--    highlight_opened_files = "none",
--
--    indent_markers = {
--      enable = true,
--    },
--
--    icons = {
--      show = {
--        file = true,
--        folder = true,
--        folder_arrow = true,
--        git = true,
--      },
--
--      glyphs = {
--        default = "󰈚",
--        symlink = "",
--        folder = {
--          --default = "",
--          empty = "",
--          empty_open = "",
--          open = "",
--          symlink = "",
--          symlink_open = "",
--          arrow_open = "",
--          arrow_closed = "",
--        },
--        git = {
--          unstaged = "✗",
--          staged = "✓",
--          unmerged = "",
--          renamed = "➜",
--          untracked = "★",
--          deleted = "",
--          ignored = "◌",
--        },
--      },
--    },
--  },
--})
