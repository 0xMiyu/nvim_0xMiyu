local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '≤', '<Cmd>BufferPrevious<CR>', opts) --sending '<A-,>'
map('n', '≥', '<Cmd>BufferNext<CR>', opts) --sending '<A-.>'
-- Re-order to previous/next
map('n', '…', '<Cmd>BufferMovePrevious<CR>', opts) --sending '<A-:>'
map('n', 'æ', '<Cmd>BufferMoveNext<CR>', opts) --sending '<A-'>'
-- Close buffer
map('n', 'ç', '<Cmd>BufferClose<CR>', opts)

