--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

require("user")
require("overrides")
-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = 'mocha'

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.insert_mode["<C-l>"] = "<Esc>ea"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>fs"] = ":w<cr>"
lvim.keys.normal_mode["<leader>["] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<leader>]"] = ":NvimTreeFocus<cr>"
lvim.keys.normal_mode["<leader>wv"] = ":vs<cr>"
lvim.keys.normal_mode["<leader>ws"] = ":sp<cr>"
lvim.keys.normal_mode["<leader>wd"] = "<C-w>q"
lvim.keys.normal_mode["<leader><Tab>"] = "<C-^>"
lvim.keys.normal_mode["<leader>l"] = ":Telescope buffers<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "K")
-- vim.keymap.del("n", "<leader>w")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  --   -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-c>"] = actions.close,
    -- ["<C-h>"] = "which_key",
  },
  --   -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.telescope_fzy = true
lvim.builtin.peek = true
lvim.builtin.telescope.defaults.layout_strategy = 'vertical'
lvim.builtin.telescope.defaults.sorting_strategy = 'descending'
lvim.builtin.telescope.defaults.layout_config.vertical = {
  mirror = false,
  preview_cutoff = 0,
  height = 0.9,
  width = 0.9,
  prompt_position = "bottom",
}
lvim.builtin.trouble = true
lvim.builtin.intend_line = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false
lvim.lsp.peek.max_height = 115
lvim.lsp.peek.max_width = 85
-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "tanvirtin/vgit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      config = function()
        require("vgit").setup()
      end,
    },
  },
  {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  { "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-gps").setup(require "user.plugins.gps")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  { "hrsh7th/cmp-emoji" },
  { "stevearc/dressing.nvim" },
  { "jose-elias-alvarez/nvim-lsp-ts-utils", config = function()
    local lspconfig = require('lspconfig')
    lspconfig.tsserver.setup({
      init_options = require("nvim-lsp-ts-utils").init_options,
      on_attach = function(client, bufnr)
        local ts_utils = require('nvim-lsp-ts-utils')
        ts_utils.setup({
          debug = false,
          disable_commands = false,
          enable_import_on_completion = true,

          -- import all
          import_all_timeout = 5000, -- ms
          -- lower numbers = higher priority
          import_all_priorities = {
            same_file = 1, -- add to existing import statement
            local_files = 2, -- git files or files with relative path markers
            buffer_content = 3, -- loaded buffer content
            buffers = 4, -- loaded buffer names
          },
          import_all_scan_buffers = 100,
          import_all_select_source = false,
          -- if false will avoid organizing imports
          always_organize_imports = true,

          -- filter diagnostics
          filter_out_diagnostics_by_severity = {},
          filter_out_diagnostics_by_code = {},

          -- inlay hints
          auto_inlay_hints = false,
          inlay_hints_highlight = "Comment",
          inlay_hints_priority = 200, -- priority of the hint extmarks
          inlay_hints_throttle = 150, -- throttle the inlay hint request
          inlay_hints_format = { -- format options for individual hint kind
            Type = {},
            Parameter = {},
            Enum = {},
            -- Example format customization for `Type` kind:
            -- Type = {
            --     highlight = "Comment",
            --     text = function(text)
            --         return "->" .. text:sub(2)
            --     end,
            -- },
          },

          -- update imports on file move
          update_imports_on_move = false,
          require_confirmation_on_move = true,
          watch_dir = nil,
        })
        ts_utils.setup_client(client)
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oo", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oa", ":TSLspImportAll<CR>", opts)
      end
    })
  end }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd({ "CursorMoved", "BUfWinEnter", "BufFilePost" }, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
    }
    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end
    local value = require("user.winbar").gps()
    if value == nil then
      value = require("user.winbar").filename()
    end
    vim.opt_local.winbar = value
  end,
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
