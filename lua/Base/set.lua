vim.g.have_nerd_font = true
vim.opt.conceallevel = 2
vim.opt.number = true
vim.g.netrw_browsex_viewer = "-"
vim.opt.showmode = true
vim.g.netrw_banner = 0
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.colorcolumn = "40"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 0
vim.opt.hlsearch = true
vim.opt.guicursor = ""
vim.opt.nu = true
vim.o.background = "dark"
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/nvim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local mini_surround = require('mini.surround')
        -- Using vim.keymap.set to call mini_surround.add() directly
        vim.keymap.set('v', '<M-C-R>', function() mini_surround.add('mR') end,
            { buffer = true, noremap = true, silent = true })
        vim.keymap.set('v', '<M-C-G>', function() mini_surround.add('mG') end,
            { buffer = true, noremap = true, silent = true })
        vim.keymap.set('v', '<M-C-B>', function() mini_surround.add('mB') end,
            { buffer = true, noremap = true, silent = true })
    end,
})


-- Open binary files
vim.api.nvim_create_autocmd("BufReadCmd", {
    pattern = "*.pdf",
    callback = function()
        local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
        vim.cmd("silent !zathura " .. filename .. " &")
        vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
    end
})

vim.api.nvim_create_autocmd("BufReadCmd", {
    pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
    callback = function()
        local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
        vim.cmd("silent !nsxiv " .. filename .. " &")
        vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
    end
})
vim.keymap.set('n', '<leader>d', function()
    local note_path = "/home/aboud/Dropbox/notes/" .. os.date("%Y-%m-%d") .. ".md"
    if vim.fn.filereadable(note_path) == 1 then
        vim.cmd("edit " .. vim.fn.fnameescape(note_path))
    else
        print("Daily note does not exist!")
    end
end, { noremap = true, silent = true })
