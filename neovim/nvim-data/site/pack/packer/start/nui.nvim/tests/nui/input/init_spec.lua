pcall(require, "luacov")

local Input = require("nui.input")
local Text = require("nui.text")
local h = require("tests.helpers")

local eq, feedkeys = h.eq, h.feedkeys

-- Input's functionalities are not testable using headless nvim.
-- Not sure what to do about it.

describe("nui.input", function()
  local parent_winid, parent_bufnr
  local popup_options
  local input

  before_each(function()
    parent_winid = vim.api.nvim_get_current_win()
    parent_bufnr = vim.api.nvim_get_current_buf()

    popup_options = {
      relative = "win",
      position = "50%",
      size = 20,
    }
  end)

  after_each(function()
    if input then
      input:unmount()
      input = nil
    end
  end)

  pending("o.prompt", function()
    it("supports NuiText", function()
      local prompt_text = "> "
      local hl_group = "NuiInputTest"

      input = Input(popup_options, {
        prompt = Text(prompt_text, hl_group),
      })

      input:mount()
      vim.wait(100, function() end)

      h.assert_buf_lines(input.bufnr, {
        prompt_text,
      })

      h.assert_highlight(input.bufnr, input.ns_id, 1, prompt_text, hl_group)
    end)
  end)

  describe("o.on_change", function()
    it("works", function()
      local done = false
      local values = {}

      input = Input(popup_options, {
        on_change = function(value)
          values[#values + 1] = value
        end,
        on_close = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      feedkeys("aa", "x") -- append a
      feedkeys("ab", "x") -- append b
      feedkeys("ac", "x") -- append c

      vim.fn.wait(100, function()
        return done
      end)

      eq(values, { "a", "ab", "abc" })
    end)
  end)

  describe("o.on_close", function()
    it("is called on <C-c>", function()
      local done = false

      input = Input(popup_options, {
        on_close = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      feedkeys("i<C-c>", "x")

      vim.fn.wait(2000, function()
        return done
      end)

      eq(done, true)
    end)

    it("is called on unmount", function()
      local done = false

      input = Input(popup_options, {
        on_close = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      input:unmount()

      vim.fn.wait(200, function()
        return done
      end)

      eq(done, true)
    end)
  end)

  describe("cursor_position_patch", function()
    local initial_cursor

    local function setup()
      vim.api.nvim_buf_set_lines(parent_bufnr, 0, -1, false, {
        "1 nui.nvim",
        "2 nui.nvim",
        "3 nui.nvim",
      })
      initial_cursor = { 2, 4 }
      vim.api.nvim_win_set_cursor(parent_winid, initial_cursor)
    end

    it("works after submitting from insert mode", function()
      setup()

      local done = false
      input = Input(popup_options, {
        on_submit = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      feedkeys("<cr>", "x")

      vim.fn.wait(1000, function()
        return done
      end)

      eq(done, true)
      eq(vim.api.nvim_win_get_cursor(parent_winid), initial_cursor)
    end)

    it("works after submitting from normal mode", function()
      setup()

      local done = false
      input = Input(popup_options, {
        on_submit = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      feedkeys("<esc><cr>", "x")

      vim.fn.wait(1000, function()
        return done
      end)

      eq(done, true)
      eq(vim.api.nvim_win_get_cursor(parent_winid), initial_cursor)
    end)

    it("works after closing from insert mode", function()
      setup()

      local done = false
      input = Input(popup_options, {
        on_close = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      input:map("i", "<esc>", function()
        input:unmount()
      end, { nowait = true, noremap = true })

      feedkeys("i<esc>", "x")

      vim.fn.wait(1000, function()
        return done
      end)

      eq(done, true)
      eq(vim.api.nvim_win_get_cursor(parent_winid), initial_cursor)
    end)

    it("works after closing from normal mode", function()
      setup()

      local done = false
      input = Input(popup_options, {
        on_close = function()
          done = true
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      input:map("n", "<esc>", function()
        input:unmount()
      end, { nowait = true, noremap = true })

      feedkeys("<esc>", "x")

      vim.fn.wait(1000, function()
        return done
      end)

      eq(done, true)
      eq(vim.api.nvim_win_get_cursor(parent_winid), initial_cursor)
    end)
  end)

  describe("method :mount", function()
    it("is idempotent", function()
      input = Input(popup_options, {})

      input:mount()
      vim.wait(100, function() end)

      local bufnr, winid = input.bufnr, input.winid

      eq(type(bufnr), "number")
      eq(type(winid), "number")

      input:mount()

      eq(bufnr, input.bufnr)
      eq(winid, input.winid)
    end)
  end)

  describe("method :unmount", function()
    it("is idempotent", function()
      local done = 0

      input = Input(popup_options, {
        on_close = function()
          done = done + 1
        end,
      })

      input:mount()
      vim.wait(100, function() end)

      input:unmount()
      input:unmount()
      input:unmount()

      vim.fn.wait(200, function()
        return done > 1
      end)

      eq(done, 1)
    end)
  end)
end)
