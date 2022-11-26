lvim.builtin.which_key.mappings["l"] = { "<cmd>Telescope buffers<cr>", "Open Recent File" }


lvim.builtin.which_key.mappings["i"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>BufferLinePick<cr>", "Pick buffer" }
lvim.builtin.which_key.mappings["["] = { "<cmd>:NvimTreeToggle<cr>", "Toggle Explorer" }
lvim.builtin.which_key.mappings["]"] = { "<cmd>:NvimTreeFindFile<cr>", "Focus Explorer" }
lvim.builtin.which_key.mappings["<Tab>"] = { "<C-^>", "Alternate Buffer" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Diagnostic Info" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>:wa<cr>", "Save all buffers" }
lvim.builtin.which_key.mappings["sa"] = { "<cmd>Telescope grep_string search=<cr>", "Fuzzy Find In File" }
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep Text" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope grep_string<cr>", "Find word under caret" }
lvim.builtin.which_key.mappings["sG"] = { "<cmd>require'telescope.builtin'.grep_string{ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' } <cr>",
  "Find word under caret" }
lvim.builtin.which_key.mappings["sr"] = { "<cmd>lua require('spectre').open_file_search()<cr>", "Find and replace" }

lvim.builtin.which_key.mappings["b"] = {
  name = 'BUFFERS',
  e = { "<cmd>source %<CR>", "Source Buffer" },
  k = { "<cmd>BufferKill<CR>", "Kill" },
  S = { ":w<cr>", "Save Current " },
  j = { "<cmd>BufferLinePick<cr>", "Jump" },
  f = { "<cmd>Telescope buffers<cr>", "Find" },
  b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
  -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
  c = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
  h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
  l = {
    "<cmd>BufferLineCloseRight<cr>",
    "Close all to the right",
  },
  D = {
    "<cmd>BufferLineSortByDirectory<cr>",
    "Sort by directory",
  },
  L = {
    "<cmd>BufferLineSortByExtension<cr>",
    "Sort by language",
  },
}
lvim.builtin.which_key.mappings["c"] = {
  name = "CODE+LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  o = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  f = { require("lvim.lsp.utils").format, "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  y = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
  j = {
    vim.diagnostic.goto_next,
    "Next Diagnostic",
  },
  k = {
    vim.diagnostic.goto_prev,
    "Prev Diagnostic",
  },
  l = { vim.lsp.codelens.run, "CodeLens Action" },
  p = {
    name = "Peek",
    d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
    t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
    i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
  },
  q = { vim.diagnostic.setloclist, "Quickfix" },
  r = { vim.lsp.buf.rename, "Rename" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}
lvim.builtin.which_key.mappings["q"] = {
  name = 'Quickfix',
  n = { "<cmd>cnext<cr>", "qf Next" },
  q = { ":call QuickFixToggle()<cr>", "Toggle qf" },
  p = { "<cmd>cprev<cr>", "qf Prev" },
  x = { "<cmd>ClearQuickFixList<cr>", "Clear qf" },
}

lvim.builtin.which_key.mappings["f"] = {
  name = 'Files',
  f = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" },
  e = {
    name = "+CONFIG",
    f = { "<cmd>lua require('telescope.builtin').git_files({ prompt_title = '<Lvim Files>', cwd = '~/.config/lvim' })<cr>",
      "Config files" }
  },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  s = { ":wa<cr>", "Save All" },
  S = { ":w<cr>", "Save Current " },
  c = { "<cmd>Telescope grep_string<cr>", "Find Word Under Caret" },
  w = { "<cmd>lua require('spectre').open_visual({ select_word = true })<cr>", "Specte" },
}
lvim.builtin.which_key.mappings["h"] = {
  name = '+HOP',
}
lvim.builtin.which_key.mappings["n"] = {
  name = "+DEBUG",
  a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
  f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
  F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
  l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
  L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
  n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
  N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
  o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
  S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
}
lvim.builtin.which_key.mappings["o"] = {
  name = "+Custom",
  f = { require("lvim.lsp.utils").format, "Format" },
  F = { "<cmd>FormatModifications", "Format Modifications" },
  o = { "Organize Imports" },
  a = { "Import All" },
  l = { "Debug Print" },
  L = { "Debug Print (above)" },
  p = { "Debug Print (above)" },
}
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["j"] = {
  name = "+jump/join",
  j = { "<cmd>:TSJJoin<CR>", "TSJJoin" },
  s = { "<cmd>:TSJSplit<CR>", "TSJSplit" },
  t = { "<cmd>:TSJToggle<CR>", "TSJToggle" },
}
lvim.builtin.which_key.mappings["k"] = {
  name = "+LSP SAGA"
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  n = { "<cmd>lua require('notify').dismiss()<cr>", "Notifications dismiss" },
  r = { "<cmd>Trouble lsp_references<cr>", "references" },
  t = { "<cmd>TroubleToggle<cr>", "toggle trouble" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["v"] = {
  name = "+VISUAL"
}
lvim.builtin.which_key.mappings["w"] = {
  name = 'WINDOW',
  d = { "<C-w>q", 'Close' },
  v = { "<C-w>v", "Split Vertical" },
  s = { "<C-w>s", "Split Horizontal" },
}

-- local _, wk = pcall(require, "which-key")
-- local show = wk.show
-- wk.show = function(keys, opts)
--   if vim.bo.filetype == "TelescopePrompt" then
--     local map = "<c-r>"
--     local key = vim.api.nvim_replace_termcodes(map, true, false, true)
--     vim.api.nvim_feedkeys(key, "i", true)
--   end
--   show(keys, opts)
-- end
