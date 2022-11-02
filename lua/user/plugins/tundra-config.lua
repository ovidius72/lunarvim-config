-- tundra config.
require('nvim-tundra').setup({
  transparent_background = false,
  -- editor = {
  --   search = {},
  --   substitute = {},
  -- },
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    -- conditionals = {},
    constants = { bold = true },
    -- functions = {},
    -- keywords = {},
    -- loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    -- punctuation = {},
    -- strings = {},
    types = { italic = true },
  },
  -- diagnostics = {
  --   errors = {},
  --   warnings = {},
  --   information = {},
  --   hints = {},
  -- },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    dbui = true,
    gitsigns = true,
    telescope = true,
  },
  -- overwrite = {
  --   colors = {},
  --   highlights = {},
  -- },
})

require('catppuccin').setup({
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = { 'bold' },
    numbers = {},
    booleans = { 'bold', 'italic' },
    properties = {},
    types = { 'bold' },
    operators = {},
  },
  integrations = {
    notify = true,
    treesitter_context = true,
    overseer = true,
    lsp_saga = true,
    hop = true,
    lsp_trouble = true,
    which_key = true,
    dap = {
      enabled = true,
      enable_ui = false,
    },
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
  }
})
