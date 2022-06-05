vim.api.nvim_set_keymap("n", "<C-p>", ":HopChar1<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>hw", ":HopWord<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>hh", ":HopChar1CurrentLine<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>hl", ":HopWordCurrentLine<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>hp", ":HopPattern<cr>", { silent = true })

-- [[ MOTIONS ]]
-- operations
-- vim.api.nvim_set_keymap('o', 'l', "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = true, inclusive_jump = false })<cr>", {})
-- char
vim.api.nvim_set_keymap('o', '<C-l>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', '<C-o>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', '<C-h>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', '<C-i>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})

-- visual
-- line
-- vim.api.nvim_set_keymap('v', 'l', "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = true, inclusive_jump = false })<cr>", {})
-- char
vim.api.nvim_set_keymap('v', '<C-l>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', '<C-o>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('v', '<C-h>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', '<C-i>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})

return {

}
