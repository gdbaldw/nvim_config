-- DISABLE
local function run_current_python_buffer()
    -- Get text in the current buffer
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local text = table.concat(lines,"\n")

    -- Get terminal codes for running python
    -- ("i" to enter insert before typing rest of the command)
    local py_cmd = vim.api.nvim_replace_termcodes("ipython -i -c \"(" .. text .. ")\"<cr>", true, false, true)

    -- Determine terminal window split and launch terminal
    local percent_of_win = 0.4
    local curr_win_height = vim.api.nvim_win_get_height(0) -- Current window height
    local term_height = math.floor(curr_win_height * percent_of_win) -- Terminal height
    vim.cmd(":below " .. term_height .. "split | term") -- Launch terminal (horizontal split)

    -- Press keys to run python command
    vim.api.nvim_feedkeys(py_cmd, "t", false)
end

-- Set Alt-r to run function
-- vim.keymap.set({'n'}, '<A-r>', '', { 
--     desc = "Run buffer via Neovim built-in terminal", 
--     callback = run_current_python_buffer
-- })
