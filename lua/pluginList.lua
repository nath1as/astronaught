local packer = require "packer"
local use = packer.use

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
   },
   git = {
      clone_timeout = 600, -- Timeout, in seconds, for git clones
   },
}

return packer.startup(function()
   use "wbthomason/packer.nvim"
   use {
      "glepnir/galaxyline.nvim",
      config = function()
         require("plugins.statusline").config()
      end,
   }
   use "dietsche/vim-lastplace"
   use "godlygeek/csapprox"
   use "glepnir/lspsaga.nvim"

   -- color related stuff
   use "ap/vim-css-color"
   use "siduck76/nvim-base16.lua"
   use "folke/tokyonight.nvim"
   use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
      end,
   }
   use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
         require("colorizer").setup()
         vim.cmd "ColorizerReloadAllBuffers"
      end,
   }

   -- language related plugins
   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
         require("plugins.treesitter").config()
      end,
   }
   use "kabouzeid/nvim-lspinstall"
   use { "neovim/nvim-lspconfig"}
   use {
      "onsails/lspkind-nvim",
      event = "BufRead",
      config = function()
         require("lspkind").init()
      end,
   }

   -- load compe in insert mode only
   use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
         require("plugins.compe").config()
      end,
      wants = { "LuaSnip" },
      requires = {
         {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            event = "InsertCharPre",
            config = function()
               require("plugins.compe").snippets()
            end,
         },
         "rafamadriz/friendly-snippets",
      },
   }
   use { "sbdchd/neoformat", cmd = "Neoformat" }

   -- file managing , picker etc
   use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
         require("plugins.nvimtree").config()
      end,
   }
   use {
      "kyazdani42/nvim-web-devicons",
      config = function()
         require("plugins.icons").config()
      end,
   }
   use "nvim-lua/plenary.nvim"

   -- git stuff
   use { "lewis6991/gitsigns.nvim" }
   -- neorgmode
   use {
      "vhyrro/neorg",
      config = function()
         require("neorg").setup {
            load = {
               ["core.defaults"] = {},
               ["core.norg.concealer"] = {},
               ["core.norg.dirman"] = {
                  config = {
                     workspaces = {
                        my_workspace = "~/.neorg",
                     },
                  },
               },
            },
         }
      end,
      requires = "nvim-lua/plenary.nvim",
   }
   -- misc plugins
   use {
      "windwp/nvim-autopairs",
      after = "nvim-compe",
      config = function()
         require("nvim-autopairs").setup()
         require("nvim-autopairs.completion.compe").setup {
            map_cr = true,
            map_complete = true, -- insert () func completion
         }
      end,
   }
   use { "andymass/vim-matchup", event = "CursorMoved" }
   use {
      "terrortylor/nvim-comment",
      cmd = "CommentToggle",
      config = function()
         require("nvim_comment").setup()
      end,
   }
   use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
   use {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
         require("neoscroll").setup()
      end,
   }
   use "alvan/vim-closetag"
   use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
         require("utils").blankline()
      end,
   }
end)
