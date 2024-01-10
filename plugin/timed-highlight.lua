-- ensure n and N highlight for only a brief time
local lua_command_string = ":lua require('timed-highlight').turn_off_highlight_after_expiration()<CR>"

vim.api.nvim_set_keymap('n', 'n', 'n' .. lua_command_string, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'N' .. lua_command_string, { noremap = true, silent = true })

-- ensure the initial lookup using / or ? highlight for only a brief time
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        local cmd_type = vim.fn.expand("<afile>")
        vim.schedule(
            function()
                if cmd_type ~= nil and (cmd_type == '/' or cmd_type == '?') then
                    require('timed-highlight').turn_off_highlight_after_expiration()
                end
            end
        )
    end
})
