-- load all plugins
require "pluginList"
require "options"

local g = vim.g

g.mapleader = " "
g.auto_save = false

-- colorscheme related stuff
g.nths_theme = "nths"

require "highlights"
require "mappings"

require("utils").hideStuff()
