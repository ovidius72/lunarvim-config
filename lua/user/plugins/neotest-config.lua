require('neotest').setup({
  icons = {
    expanded = "",
    -- child_prefix = "",
    -- child_indent = "",
    -- final_child_prefix = "",
    -- non_collapsible = "",
    collapsed = "",

    passed = "",
    running = "",
    failed = "",
    unknown = "",
  },
  consumers = {
    -- overseer = require("neotest.consumers.overseer"),
    -- always_open_output = function(client)
    --   local async = require("neotest.async")

    --   client.listeners.results = function(adapter_id, results)
    --     local row = async.fn.getpos(".")[2] - 1
    --     if not position then
    --       return
    --     end
    --     if not results[pos_id] then
    --       return
    --     end
    --     neotest.output.open({ position_id = pos_id, adapter = adapter_id })
    --   end
    -- end,
  },
  output = {
    enabled = true,
    -- open_on_run = true,
  },
  adapters = {
    require('neotest-jest')({
      jestCommand = "npx jest -i",
      -- jestConfigFile = 'apps/ms-user/jest.config.ts',
      cwd = function()
        return vim.fn.getcwd()
      end
    })
  }
})
