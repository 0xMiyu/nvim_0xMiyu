-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- catppuccin theme
    -- use { "catppuccin/nvim", as = "catppuccin"}
    
    use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup({
            background = "medium",
            transparent_background_level = 1,
        })
      end,
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':tsupdate'}) 

    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- lsp support
            {'neovim/nvim-lspconfig'},             -- required
            {                                      -- optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'masonupdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- optional

        -- autocompletion
        {'hrsh7th/nvim-cmp'},     -- required
        {'hrsh7th/cmp-nvim-lsp'}, -- required
        {'l3mon4d3/luasnip'},     -- required
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
    use('muniftanjim/prettier.nvim')

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
