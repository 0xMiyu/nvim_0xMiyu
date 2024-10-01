local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },


    -- catppuccin theme
    --  { "catppuccin/nvim", name = "catppuccin"}
    
    {
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup({
            background = "medium",
            transparent_background_level = 1,
        })
      end,
    },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},


     {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- lsp support
            {'neovim/nvim-lspconfig'},             -- required
            {                                      -- optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'masonupdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- optional

            -- autocompletion
            {'hrsh7th/nvim-cmp'},     -- required
            {'hrsh7th/cmp-nvim-lsp'}, -- required
            {'l3mon4d3/luasnip'},     -- required
        },
    },

    --undotree
    'mbbill/undotree',
    
    -- autopair general and html elements
    'windwp/nvim-autopairs',
     'windwp/nvim-ts-autotag',
    
    -- code formatter
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'muniftanjim/prettier.nvim',

    --git
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    --file explorer
     {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    },
    
    --harpoon 
    'theprimeagen/harpoon',
    
    --nvim tmux navigator
     { "alexghergh/nvim-tmux-navigation" },
    
    --barbar (tabline)
    {'romgrk/barbar.nvim',
         dependencies = {
           'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
           'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
         },
         init = function() vim.g.barbar_auto_setup = false end,
         opts = {
           -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
           -- animation = true,
           -- insert_at_start = true,
           -- …etc.
         },
    },

    --copilot
    'github/copilot.vim',
    
    --comment (auto commenting plugin)
     {
        'numToStr/Comment.nvim',
         dependencies = {
             'JoosepAlviste/nvim-ts-context-commentstring',
             'nvim-treesitter/nvim-treesitter'
         }
    },
   
}

require("lazy").setup(plugins, {})
