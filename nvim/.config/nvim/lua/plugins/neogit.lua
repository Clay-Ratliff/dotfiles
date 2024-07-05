local function setup_neogit()
    -- Require the neogit module
    local neogit = require('neogit')

    -- Configure Neogit
    neogit.setup({
        -- Your Neogit configuration options here
    })

    -- Setup key mappings
    vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })
end

-- Return the plugin spec
return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua",
    },
    config = setup_neogit  -- Point to the configuration function
}
