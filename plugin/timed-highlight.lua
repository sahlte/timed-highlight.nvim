-- ensure n and N highlight for only a brief time

local function searchAndOpenFold(key)
    vim.cmd('normal! ' .. key)

    if string.find(vim.o.foldopen, "search") and vim.fn.foldclosed('.') ~= -1 then
        vim.cmd('normal! zv')
    end

    require('timed-highlight').turn_off_highlight_after_expiration()
end

vim.keymap.set('n', 'n', function() searchAndOpenFold('n') end, {noremap = true, silent = true})
vim.keymap.set('n', 'N', function() searchAndOpenFold('N') end, {noremap = true, silent = true})

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
