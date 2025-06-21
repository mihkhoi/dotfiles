require("lspkind").init({
    -- Hiển thị cả biểu tượng và chữ
    mode = "symbol_text",

    -- Dùng bộ icon mặc định hỗ trợ nerd-fonts hoặc codicons
    preset = "codicons",

    -- Tùy chỉnh biểu tượng cho các loại symbol của LSP
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
      TypeAlias = "",
      Parameter = "",
      StaticMethod = "ﴂ",
      Macro = "",
      Boolean = "◩",
      Number = "",
      String = "",
      Array = "",
      Object = "",
      Key = "",
      Null = "ﳠ",
      Namespace = "",
      Package = ""
    },
})
