-- ts-context-commentstring.lua
return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    init = function()
        -- stop nvim-treesitter from loading the deprecated module
        vim.g.skip_ts_context_commentstring_module = true
    end,
    config = function()
        -- enable_autocmd=true updates &commentstring automatically,
        -- so vim-commentary / gc / gcc work in JSX/TSX without extra hooks
        require("ts_context_commentstring").setup({
            enable_autocmd = true,
        })
    end,
}
