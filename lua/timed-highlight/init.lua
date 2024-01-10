
local highlight_timer

local M = {

    setup = function (options)
        require("timed-highlight.config").setup(options)
    end,

    turn_off_highlight_after_expiration = function()

        -- Cancel the existing timer if it exists
        if highlight_timer then
            vim.fn.timer_stop(highlight_timer)
        end

        local highlight_expiration_time = require("timed-highlight.config").options.highlight_timeout_ms

        -- Set a new timer
        highlight_timer = vim.fn.timer_start(highlight_expiration_time, function()
            vim.cmd('nohlsearch')
        end)

    end
}

return M
