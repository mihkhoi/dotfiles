local lspsaga = require 'lspsaga'
lspsaga.setup { 
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "💡",--󱠂
  infor_sign = "",
  diagnostic_header_icon = "   ",
}
