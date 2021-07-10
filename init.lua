local ok, err = pcall(require, "core")
-- load all plugins
require "pluginList"
require "options"

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end
local g = vim.g

g.mapleader = " "
g.auto_save = false

-- colorscheme related stuff
g.nths_theme = "nths"
local base16 = require "base16"
base16(base16.themes["onedark"], true)

require "highlights"
require "mappings"

require("utils").hideStuff()
