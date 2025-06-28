vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
--vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- Enables system clipboard over ssh
vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}

local function move_to_done()
    -- Get the current date in MM/DD/YYYY format
    local date = os.date("%m/%d/%Y")

    -- Get the range of selected lines
    local start_line= vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Get the selected lines
    local lines = vim.fn.getline(start_line, end_line)

    -- Format lines with the date
    for i, line in ipairs(lines) do
        lines[i] = date .. " " .. line
    end

    -- Find the position of the "DONE" section
    local done_section_start = 0
    local done_section_found = false
    local total_lines = vim.fn.line("$")

    for i = 1, total_lines - 1 do
        if vim.fn.getline(i) == "DONE" and vim.fn.getline(i + 1) == "---" then
            done_section_start = i + 1 -- insert after the horizontal line
            done_section_found = true
            break
        end
    end

    -- If DONE section isn't found, create it
    if not done_section_found then
        done_section_start = total_lines + 1
        -- Append DONE and the horizontal line before the tasks
        vim.fn.append(done_section_start, "DONE")
        vim.fn.append(done_section_start, "---")
    end

    -- Append the lines to the "DONE" section
    vim.fn.append(done_section_start, lines)

    -- Optionally delete the lines after moving them to DONE
    vim.fn.deletebufline('%', start_line, end_line)
end

vim.api.nvim_create_user_command("ToggleDone", move_to_done, { range = true })

