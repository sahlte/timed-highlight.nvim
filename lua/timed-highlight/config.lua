
local M = {
    options = {
        highlight_timeout_ms = 1000 -- default timeout
    }
}
M.setup = function (options)
    M.options = vim.tbl_deep_extend("force", {}, M.options, options)
end


return M
