local keymap = vim.keymap.set

local M = {}
M.config = {
  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.

  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-j>', next = '<C-k>' },
  -- Error, Warn, Info, Hint
  -- use emoji like
  -- { "🙀", "😿", "😾", "😺" }
  -- or
  -- { "😡", "😥", "😤", "😐" }
  -- and diagnostic_header can be a function type
  -- must return a string and when diagnostic_header
  -- is function type it will have a param `entry`
  -- entry is a table type has these filed
  -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- show diagnostic source
  -- show_diagnostic_source = true,
  -- add bracket or something with diagnostic source, just have 2 elements
  -- diagnostic_source_bracket = {},
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- use emoji lightbulb in default
  code_action_icon = "💡",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "<C-c>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  definition_preview_icon = "  ",
  -- show symbols in winbar must nightly
  -- symbol_in_winbar = {
  --   in_custom = true,
  --   enable = true,
  --   separator = ' ',
  --   show_file = true,
  --   click_support = true,
  -- },
  -- show outline
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
}
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "<leader>kf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- -- Code action
keymap("n", "<leader>ka", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ka", ":<C-u>Lspsaga range_code_action<CR>", { silent = true })

-- -- Rename
keymap("n", "<leader>kr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- -- Definition preview
keymap("n", "<leader>kp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
keymap("n", "<leader>kd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- -- Show line diagnostics
keymap("n", "<leader>ke", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- -- Show cursor diagnostic
keymap("n", "<leader>kc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- -- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- -- Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })

-- -- -- Outline
keymap("n", "<leader>ko", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- -- Hover Doc
keymap("n", "<leader>kk", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- -- scroll in hover doc or  definition preview window
-- vim.keymap.set("n", "<C-f>", function()
--   action.smart_scroll_with_saga(1)
-- end, { silent = true })
-- -- scroll in hover doc or  definition preview window
-- vim.keymap.set("n", "<C-b>", function()
--   action.smart_scroll_with_saga(-1)
-- end, { silent = true })

-- local function get_file_name(include_path)
--   local file_name = require("lspsaga.symbolwinbar").get_file_name()
--   if vim.fn.bufname("%") == "" then
--     return ""
--   end
--   if include_path == false then
--     return file_name
--   end
--   -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
--   local sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
--   local path_list = vim.split(string.gsub(vim.fn.expand("%:~:.:h"), "%%", ""), sep)
--   local file_path = ""
--   for _, cur in ipairs(path_list) do
--     file_path = (cur == "." or cur == "~") and "" or file_path .. cur .. "%#LspSagaWinbarSep#/%*" .. "%*"
--   end
--   return file_path .. file_name
-- end

-- local function config_winbar()
--   local exclude = {
--     ["teminal"] = true,
--     ["toggleterm"] = true,
--     ["prompt"] = true,
--     ["NvimTree"] = true,
--     ["help"] = true,
--   } -- Ignore float windows and exclude filetype
--   if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
--     vim.wo.winbar = ""
--   else
--     local ok, lspsaga_symbolwinbar = pcall(require, "lspsaga.symbolwinbar")
--     local sym
--     if ok then
--       sym = lspsaga_symbolwinbar.get_symbol_node()
--     end
--     local win_val = ""
--     win_val = get_file_name(true) -- set to true to include path
--     if sym ~= nil then
--       win_val = win_val .. sym
--     end
--     vim.wo.winbar = win_val
--   end
-- end

-- local events = { "BufEnter", "BufWinEnter", "CursorMoved" }

-- vim.api.nvim_create_autocmd(events, {
--   pattern = "*",
--   callback = function()
--     config_winbar()
--   end,
-- })

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "LspsagaUpdateSymbol",
--   callback = function()
--     config_winbar()
--   end,
-- })

-- local kind = require("lspsaga.lspkind")
-- kind[1][2] = " "
-- kind[2][2] = " "
-- kind[5][2] = "ﴯ "
-- kind[6][2] = " "
-- kind[7][2] = "ﰠ "
-- kind[9][2] = " "
-- kind[11][2] = " "
-- kind[12][2] = " "
-- kind[13][2] = " "
-- kind[14][2] = " "
-- kind[15][2] = " "
-- kind[16][2] = " "
-- kind[20][2] = " "
-- kind[22][2] = " "


return M
