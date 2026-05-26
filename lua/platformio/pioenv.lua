local utils = require('platformio.utils')
local M = {}

function pioenv()
    if not utils.pio_install_check() then
        return
    end
    utils.cd_pioini()

    -- TODO: execute target list command
    local cmd = 'pio run --list-targets'
    local stdio_stream = io.popen(cmd, 'r')
    -- TODO: error checking
    if type(stdio_stream) == type(string) then
        vim.notify('opening stdio failed', vim.log.levels.ERROR)
        return
    end
    local stream_string = io.read()
    if os.execute('echo' .. '"' .. stream_string .. '" > ' .. utils.get_os_user_data_dir()) == true then
        vim.notify('writing to file failed', vim.log.levels.ERROR)
        stdio_stream:close()
        return
    end
    stdio_stream:close()
    -- TODO: parse output
    -- TODO: execute picker
    return
end

return M
