local M = {}

M.config = function()
    local gl = require("galaxyline")
    local gls = gl.section
    local condition = require("galaxyline.condition")

    gl.short_line_list = {" "}

    local global_theme = "themes/" .. vim.g.nths_theme
    local colors = require(global_theme)

    gls.left[1] = {
        FirstElement = {
            provider = function()
                return "▋"
            end,
            highlight = {colors.nord_blue, colors.nord_blue}
        }
    }

    gls.left[2] = {
        statusIcon = {
            provider = function()
                return " ⊓ "
            end,
            highlight = {colors.statusline_bg, colors.nord_blue},
            separator = "  ",
            separator_highlight = {colors.nord_blue, colors.lightbg}
        }
    }


    gls.left[3] = {
        current_dir = {
            provider = function()
                local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                return "  " .. dir_name .. " "
            end,
            highlight = {colors.grey_fg2, colors.lightbg2},
            separator_highlight = {colors.lightbg2, colors.statusline_bg}
        }
    }

    gls.left[4] = {
        FileIcon = {
            provider = "FileIcon",
            condition = condition.buffer_not_empty,
            highlight = {colors.purple, colors.statusline_bg}
        }
    }

    gls.left[5] = {
        FileName = {
            provider = {"FileName"},
            condition = condition.buffer_not_empty,
            highlight = {colors.blue, colors.statusline_bg},
            separator_highlight = {colors.lightbg, colors.lightbg2}
        }
    }


    local checkwidth = function()
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 30 then
            return true
        end
        return false
    end

    gls.left[6] = {
        DiffAdd = {
            provider = "DiffAdd",
            condition = checkwidth,
            icon = "  ",
            highlight = {colors.white, colors.statusline_bg}
       }
    }

    gls.left[7] = {
        DiffModified = {
            provider = "DiffModified",
            condition = checkwidth,
            icon = "   ",
            highlight = {colors.grey_fg2, colors.statusline_bg}
        }
    }

    gls.left[8] = {
        DiffRemove = {
            provider = "DiffRemove",
            condition = checkwidth,
            icon = "  ",
            highlight = {colors.grey_fg2, colors.statusline_bg}
        }
    }

    gls.left[9] = {
        DiagnosticError = {
            provider = "DiagnosticError",
            icon = "  ",
            highlight = {colors.red, colors.statusline_bg}
        }
    }

    gls.left[10] = {
        DiagnosticWarn = {
            provider = "DiagnosticWarn",
            icon = "  ",
            highlight = {colors.yellow, colors.statusline_bg}
        }
    }

    gls.right[1] = {
        GitIcon = {
            provider = function()
                return " "
            end,
            condition = require("galaxyline.condition").check_git_workspace,
            highlight = {colors.grey_fg2, colors.statusline_bg},
            separator = " ",
            separator_highlight = {colors.statusline_bg, colors.statusline_bg}
        }
    }

    gls.right[2] = {
        GitBranch = {
            provider = "GitBranch",
            condition = require("galaxyline.condition").check_git_workspace,
            highlight = {colors.grey_fg2, colors.statusline_bg}
        }
    }

    gls.right[3] = {
        line_percentage = {
            provider = function()
                local current_line = vim.fn.line(".")
                local total_line = vim.fn.line("$")

                if current_line == 1 then
                    return "  0% "
                elseif current_line == vim.fn.line("$") then
                    return "  100% "
                end
                local result, _ = math.modf((current_line / total_line) * 100)
                return "  " .. result .. "% "
            end,
            highlight = {colors.green, colors.lightbg}
        }
    }
end
return M
