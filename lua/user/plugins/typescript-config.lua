local lvimLspUtils = require('lvim.lsp.utils')
require('typescript').setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    on_attach = function(client, bufnr)
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
  },
})
