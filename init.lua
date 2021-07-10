-- load all plugins
require "pluginList"
require "options"

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
