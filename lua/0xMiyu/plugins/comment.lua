-- comment.nvim extension for gcc and stuff
return {
    {
        "numToStr/Comment.nvim",
        dependencies = {
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                config = function()
                    -- auto-update &commentstring based on cursor context
                    require("ts_context_commentstring").setup({ enable_autocmd = true })
                end,
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup({
                pre_hook = function(ctx)
                    -- Make comments JSX-aware
                    local U = require("Comment.utils")
                    local internal = require("ts_context_commentstring.internal")
                    local utils = require("ts_context_commentstring.utils")

                    local location
                    if ctx.ctype == U.ctype.block then
                        location = utils.get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = utils.get_visual_start_location()
                    end

                    return internal.calculate_commentstring({
                        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                        location = location,
                    })
                end,
            })
        end,
    },
}
