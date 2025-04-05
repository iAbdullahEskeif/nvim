return
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    keys = {
        { "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        win = { enabled = true },
        zen = { enabled = true },
        scratch = {
            enabled = true,
            width = 50,
            height = 15,
            bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
            minimal = true,
            noautocmd = false,
            -- position = "right",
            zindex = 20,
            wo = { winhighlight = "NormalFloat:Normal" },
            border = "rounded",
            title_pos = "center",
            footer_pos = "center",
        },
        lazygit = { enabled = true },

    },
}
