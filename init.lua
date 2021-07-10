local ok, err = pcall(require, "core")
-- load all plugins
require "pluginList"
require "options"

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end
