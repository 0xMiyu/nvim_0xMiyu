local nvim_tmux_nav = require('nvim-tmux-navigation')

vim.keymap.set('n', "<A-h>", ":NvimTmuxNavigateLeft<CR>")
vim.keymap.set('n', "<A-l>", ":NvimTmuxNavigateRight<CR>")
vim.keymap.set('n', "<A-j>", ":NvimTmuxNavigateDown<CR>")
vim.keymap.set('n', "<A-k>", ":NvimTmuxNavigateUp<CR>")
