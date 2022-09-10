--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.colorscheme = "material"
vim.g.material_style = 'deep ocean'

lvim.log.level = "warn"
lvim.format_on_save = false
vim.g.catppuccin_flavour = 'macchiato'
vim.g.sherbet_italic_keywords = true
vim.g.sherbet_italic_functions = false
vim.g.sherbet_italic_comments = true
vim.g.sherbet_italic_loops = true
vim.g.sherbet_italic_conditionals = true

vim.g.oxocarbon_lua_keep_terminal = true
vim.g.oxocarbon_lua_alternative_telescope = true


-- Rnvimr
lvim.keys.normal_mode["<A-o>"] = "<cmd>RnvimrToggle<cr>"

-- PickColor
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>tp", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-;>", "<cmd>PickColorInsert<cr>", opts)


vim.keymap.set("n", "<space>op", function()
  return require('debugprint').debugprint()
end, {
  expr = true,
})
vim.keymap.set("n", "<space>op", function()
  return require('debugprint').debugprint({ above = true })
end, {
  expr = true,
})
vim.keymap.set("n", "<space>ol", function()
  return require('debugprint').debugprint({ variable = true })
end, {
  expr = true,
})
vim.keymap.set("n", "<space>oL", function()
  return require('debugprint').debugprint({ above = true, variable = true })
end, {
  expr = true,
})

lvim.keys.normal_mode['<leader>od'] = "<cmd>:DeleteDebugPrints<cr>"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.builtin.cmp.formatting.kind_icons = require('user.icons').kind
lvim.keys.normal_mode['<leader>q'] = false
-- add your own keymapping
-- lvim.keys.insert_mode["<C-l>"] = "<Esc>ea"
-- lvim.keys.insert_mode["<C-y>"] = "<Esc>gea"
lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.normal_mode["<leader>wd"] = "<C-w>q"
lvim.keys.normal_mode["<leader><Tab>"] = "<C-^>"
lvim.keys.normal_mode["]g"] = "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
lvim.keys.normal_mode["[g"] = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
lvim.keys.normal_mode["gh"] = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>"


-- harpoon
lvim.keys.normal_mode["<leader>hi"] = "<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<cr>"
lvim.keys.normal_mode["<leader>hp"] = "<cmd>lua require 'harpoon.ui'.nav_prev()<cr>"
lvim.keys.normal_mode["<leader>hn"] = "<cmd>lua require 'harpoon.ui'.nav_next()<cr>"
lvim.keys.normal_mode["<leader>ha"] = "<cmd>lua require 'harpoon.mark'.add_file()<cr>"

-- telescope frecency
lvim.keys.normal_mode["<leader>fo"] = "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>"

vim.api.nvim_set_keymap('n', '<A-n>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-n>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-p>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-o>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-u>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-o>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-u>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })

-- toggle quickfix
Toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

vim.cmd [[
command! ClearQuickFixList cexpr []
]]

-- lvim.builtin.cmp.formatting.source_names["copilot"] = "ghu_v9g2sqDpmXflqahsBGGLz7dqkHW46w2xqHIW"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

vim.cmd("nnoremap gy <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.cmd("nnoremap gY <gcmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")

vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
-- vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
-- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
-- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
-- vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- unmap a default keymapping
vim.keymap.del("n", "<C-q>")
-- vim.keymap.del("n", "K")
-- vim.keymap.del("n", "<leader>w")
-- override a default keymapping

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

lvim.builtin.which_key.setup.plugins.presets.g = false
-- lvim.builtin.which_key.setup.plugins.presets.nav = false
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.telescope_fzy = true
lvim.builtin.telescope_fzf = true
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
lvim.use_icons = true
lvim.builtin.intend_line = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
  { key = "h", action = "close_node" },
  { key = "v", action = "vsplit" },
  { key = "C", action = "cd" },
  { key = "<leader>]", cb = "<C-w><C-p>" },
}
-- lvim.builtin.nvimtree.show_icons.git = true
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "fzy_native")
  pcall(telescope.load_extension, "fzf_native")
  pcall(telescope.load_extension, "recent_files")
  pcall(telescope.load_extension, "harpoon")
end

lvim.builtin.lualine.options.globalstatus = true
-- local _, navic = pcall(require, "nvim-navic")
-- lvim.builtin.lualine.sections.lualine_c = {
--   { navic.get_location, cond = navic.is_available },
-- }
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "dockerfile",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "http",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false
lvim.lsp.peek.max_height = 115
lvim.lsp.peek.max_width = 85
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
local lvimLspUtils = require('lvim.lsp.utils')
lvim.lsp.on_attach_callback = function(client, bufnr)
  if client.name == 'tsserver' then
    print('DEBUGPRINT[2]: config.lua:240: bufnr=' .. vim.inspect(bufnr))
    vim.keymap.set("n", "<leader>oo", function()
      local ts = require("typescript").actions
      ts.removeUnused({ sync = true })
      lvimLspUtils.format({ sync = true })
      vim.api.nvim_create_autocmd("DiagnosticChanged", {
        buffer = bufnr,
        callback = function()
          -- send another request once the server has flushed pending diagnostics
          ts.addMissingImports({ sync = true })
        end,
        once = true,
      })
    end)

  end
  -- local function buf_set_option(...)
  --   vim.api.nvim_buf_set_option(bufnr, ...)
  -- end
  -- --Enable completion triggered by <c-x><c-o>
  -- navic.attach(client, bufnr)
end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
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
  {
    "marko-cerovac/material.nvim",
    config = function()
      require('material').setup({
        lualine_style = "stealth",
        contrast = {
          sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false, -- Enable contrast for floating windows
          line_numbers = false, -- Enable contrast background for line numbers
          sign_column = false, -- Enable contrast background for the sign column
          cursor_line = true, -- Enable darker background for the cursor line
          non_current_windows = true, -- Enable darker background for non-current windows
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
    end
  },
  { "olivercederborg/poimandres.nvim",
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        bold_vert_split = true, -- use bold vertical separators
        dim_nc_background = true, -- dim 'non-current' window backgrounds
        disable_background = false, -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false, -- disable italics
      }
    end
  },
  { "ThePrimeagen/harpoon",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('harpoon').setup()
    end,
  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker").setup({
        { -- for changing icons & mappings
          -- ["icons"] = { "ﱢ", "" },
          -- ["icons"] = { "ﮊ", "" },
          -- ["icons"] = { "", "ﰕ" },
          -- ["icons"] = { "", "" },
          -- ["icons"] = { "", "" },
          ["icons"] = { "ﱢ", "" },
          ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
          ["keymap"] = { -- mapping example:
            ["U"] = "<Plug>ColorPickerSlider5Decrease",
            ["O"] = "<Plug>ColorPickerSlider5Increase",
          },
          ["background_highlight_group"] = "Normal", -- default
          ["border_highlight_group"] = "FloatBorder", -- default
          ["text_highlight_group"] = "Normal", --default
        }
      })
    end
  },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   config = function()
  --     require("github-theme").setup({
  --       theme_style = "dark",
  --     })
  --   end
  -- },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = 'main',
    config = function()
      require('user.plugins.saga')
    end
  },
  { "folke/tokyonight.nvim" },
  { "mg979/vim-visual-multi" },
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
      require("nvim-gps").setup(require "user.plugins.configs.gps")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({
        bind = true,
        border = 'rounded'
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    run = "make",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
    },
  },
  { "smartpde/telescope-recent-files" },
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup({
        history = 1000,
        enable_persistent_history = true,
        length_limit = 1048576,
        continuous_sync = true,
        keys = {
          telescope = {
            i = {
              select = '<cr>',
              paste = '<c-p>',
              paste_behind = '<c-i>',
              replay = '<c-q>', -- replay a macro
              delete = '<c-d>', -- delete an entry
              custom = {},
              -- ["<C-j>"] = actions.move_selection_next,
              -- ["<C-k>"] = actions.move_selection_previous,
              -- ["<C-n>"] = actions.cycle_history_next,
              -- -- ["<C-p>"] = actions.cycle_history_prev,
              -- ["<C-c>"] = actions.close,
            },
            n = {
              select = '<cr>',
              paste = 'p',
              --- It is possible to map to more than one key.
              -- paste = { 'p', '<c-p>' },
              paste_behind = 'P',
              replay = 'q',
              delete = 'd',
              custom = {},
              -- ["<C-j>"] = actions.move_selection_next,
              -- ["<C-k>"] = actions.move_selection_previous,
            },
          }
        }
      })
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  { "EdenEast/nightfox.nvim" },
  { "B4mbus/oxocarbon-lua.nvim" },
  { "tpope/vim-repeat" },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  { "hrsh7th/cmp-emoji" },
  { "stevearc/dressing.nvim" },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { "phaazon/hop.nvim",
    config = function()
      require('hop').setup(require('user.plugins.configs.hop-config'))
    end
  },
  -- { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  { "jose-elias-alvarez/typescript.nvim",
    configure = function()
      print('DEBUGPRINT[4]: config.lua:468 (after configure = function())')
      require('user.plugins.typescript-config')
    end },
  { "ray-x/navigator.lua",
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    }
  },
  {
    "gaelph/logsitter.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    'machakann/vim-sandwich',
    config = function()
      -- Use vim surround-like keybindings
      vim.cmd('runtime macros/sandwich/keymap/surround.vim')
      -- '{' will insert space, '}' will not
      vim.g['sandwich#recipes'] = vim.list_extend(vim.g['sandwich#recipes'], {
        { buns = { '{ ', ' }' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' },
          input = { '{' } },
        { buns = { '[ ', ' ]' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' },
          input = { '[' } },
        { buns = { '( ', ' )' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' },
          input = { '(' } },
        { buns = { '{\\s*', '\\s*}' }, nesting = 1, regex = 1, match_syntax = 1,
          kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '{' } },
        { buns = { '\\[\\s*', '\\s*\\]' }, nesting = 1, regex = 1, match_syntax = 1,
          kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '[' } },
        { buns = { '(\\s*', '\\s*)' }, nesting = 1, regex = 1, match_syntax = 1,
          kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '(' } }
      })
      vim.cmd [[
        silent! nmap <unique><silent><leader>vsd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
        silent! nmap <unique><silent><leader>vsr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
        silent! nmap <unique><silent><leader>vsdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
        silent! nmap <unique><silent><leader>vsrb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

        " add
        silent! map <unique><leader>vsa <Plug>(operator-sandwich-add)
        " delete
        silent! xmap <unique><leader>vsd <Plug>(operator-sandwich-delete)
        " replace
        silent! xmap <unique><leader>vsr <Plug>(operator-sandwich-replace)
      ]]
    end
  },
  { 'mrjones2014/smart-splits.nvim' },
  { 'fedepujol/move.nvim' },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 0
  --   end,
  -- },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      local themes = require('telescope.themes')
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = themes.get_dropdown({ hide_preview = false })
        };
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
      }
    end
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  -- { "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },
  -- { "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
      vim.g.indent_blankline_show_context = true
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_context_patterns = {
        "typescriptStatementKeyword",
        "typescriptParenExp",
        "typescriptBlock",
        "tsTag",
        "typeDefinition",
        "tsxElement",
        "tsxTagName",
        "func_literal",
        "try",
        "php",
        "except",
        "argument_list",
        "dictionary",
        "class",
        "function",
        "method",
        "^if",
        "^else",
        "^return",
        "tag",
        "jsx",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "luaTable"
      }
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = false, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        -- easing_function = nil, -- Default easing function
        -- pre_hook = nil, -- Function to run before the scrolling animation starts
        -- post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    'tpope/vim-surround',
    keys = { "c", "d", "y" }
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    'andrewferrier/debugprint.nvim',
    config = function()
      require('debugprint').setup({
        create_keymaps = true,
        move_to_debugline = true,
      })
    end
  },
  { "nvim-neotest/neotest-vim-test" },
  -- { "SmiteshP/nvim-navic",
  --   requires = {
  --     "neovim/nvim-lspconfig"
  --   }
  -- },
  { "rebelot/kanagawa.nvim", config = function()
    require('kanagawa').setup({
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- do not set background color
      globalStatus = true, -- adjust window separators highlight for laststatus=3
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = {
        -- NormalNC = { bg = "NONE" }
      },
      theme = "default" -- Load "default" theme or the experimental "light" theme
    })
  end },
  {
    "nvim-neotest/neotest",
    wants = {
      "neotest/jest"
    },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
    },
  },
  {
    'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup()
    end
  },
  {
    "fgheng/winbar.nvim",
    config = function()
      require('winbar').setup({})
    end
  },
  { "nvim-treesitter/nvim-treesitter-context" },
}

-- vim.api.nvim_create_autocmd({ "CursorMoved", "BUfWinEnter", "BufFilePost" }, {
--   callback = function()
--     local winbar_filetype_exclude = {
--       "help",
--       "startify",
--       "dashboard",
--       "packer",
--       "neogitstatus",
--       "NvimTree",
--       "Trouble",
--       "alpha",
--       "lir",
--       "Outline",
--       "spectre_panel",
--     }
--     if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
--       vim.opt_local.winbar = nil
--       return
--     end
--     local value = require("user.winbar").gps()
--     if value == nil then
--       value = require("user.winbar").filename()
--     end
--     vim.opt_local.winbar = value
--   end,
-- })

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
require("user")
require("overrides")
