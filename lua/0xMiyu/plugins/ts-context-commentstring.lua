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

        -- Nvim 0.12+: get_parser returns nil instead of throwing
        require("ts_context_commentstring.utils").is_treesitter_active = function(bufnr)
            local ok, parser = pcall(vim.treesitter.get_parser, bufnr or 0)
            return ok and parser ~= nil
        end
    end,
}
