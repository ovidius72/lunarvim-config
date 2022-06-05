lvim.builtin.which_key.mappings["l"] = { "<cmd>Telescope buffers<cr>", "Open Recent File" }
lvim.builtin.which_key.mappings["i"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>BufferLinePick<cr>", "Pick buffer" }
lvim.builtin.which_key.mappings["]"] = { "<cmd>:NvimTreeToggle<cr>", "Toggle Explorer" }
lvim.builtin.which_key.mappings["["] = { "<cmd>:NvimTreeFocus<cr>", "Focus Explorer" }
lvim.builtin.which_key.mappings["<Tab>"] = { "<C-^>", "Alternate Buffer" }
lvim.builtin.which_key.mappings["w"] = {
  name = 'Window',
  d = { "<C-w>q", 'Close' },
  v = { "<C-w>v", "Split Vertical" },
  s = { "<C-w>s", "Split Horizontal" },
}
lvim.builtin.which_key.mappings["b"] = {
  name = 'Buffers',
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
  name = "Code+Lsp",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  o = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  f = { require("lvim.lsp.utils").format, "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
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
lvim.builtin.which_key.mappings["f"] = {
  name = 'Files',
  f = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  s = { ":wa<cr>", "Save All" },
  S = { ":w<cr>", "Save Current " },
}
lvim.builtin.which_key.mappings["o"] = {
  name = "+Custom",
  f = { require("lvim.lsp.utils").format, "Format" },
  o = { "", "Organize Imports" },
  a = { "", "Import All" },
  l = { "", "Console.Log" },
  L = { "", "Console.Log(Full Path)" },
  p = { "", "Print Log(By File Type)" },
  r = { "", "Console.Log(As Object)" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in buffer" }
lvim.builtin.which_key.mappings["sa"] = { "<cmd>Telescope grep_string<cr>", "Find Word" }
