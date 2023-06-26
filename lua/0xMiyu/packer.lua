-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "catppuccin/nvim", as = "catppuccin"}

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) 

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}

    --undotree
    use('mbbill/undotree')
    
    -- autopair general and html elements
    use('windwp/nvim-autopairs')
    use ('windwp/nvim-ts-autotag')
    
    -- code formatter
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    --git
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    --file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }
    
    --harpoon 
    use('theprimeagen/harpoon')
    
    --nvim tmux navigator
    use { "alexghergh/nvim-tmux-navigation" }
    
    --barbar (tabline)
    use ('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
    use ('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
    use ('romgrk/barbar.nvim')

    --copilot
    use('github/copilot.vim')
end)
