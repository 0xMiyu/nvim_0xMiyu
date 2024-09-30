-- Comment.nvim setup
require('Comment').setup {
    pre_hook = function(ctx)
        local U = require('Comment.utils')

        -- Determine whether to use linewise or blockwise comment
        local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

        -- Use ts_context_commentstring for JSX and similar file types
        if vim.bo.filetype == 'javascriptreact' or vim.bo.filetype == 'typescriptreact' then
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end
            return require('ts_context_commentstring.internal').calculate_commentstring {
                key = type,
                location = location,
            }
        end
    end,
}

-- Setup ts_context_commentstring
require('ts_context_commentstring').setup {}

-- Optional: Speed up loading
vim.g.skip_ts_context_commentstring_module = true

