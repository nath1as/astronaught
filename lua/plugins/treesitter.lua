local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = {
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "bash",
            "lua",
            "vim",
            "json",
            "python",
            "ruby",
            "haskell",
            "c",
            "regex",
            "latex",
            "nix",
        },
        highlight = {
            enable = true,
            use_languagetree = true
        }
    }
end

return M
