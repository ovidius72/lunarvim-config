require('material').setup({
  lualine_style = "stealth",
  contrast = {
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    line_numbers = false, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    popup_menu = false, -- Enable lighter background for the popup menu
  },
  italics = {
    comments = true, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = true, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = true -- Enable italic variables
  },
  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = true -- Enable higher contrast text for darker style
  },
})
