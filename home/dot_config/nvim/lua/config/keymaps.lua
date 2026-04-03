local map = vim.keymap.set

-- Config Management
map("n", "<Leader>r", ":source $MYVIMRC | noh<CR>", { desc = "Reload config" })

-- Window splits (Native Neovim)
map("n", "<Leader>-", ":<C-u>sp<CR>", { desc = "Split horizontal" })
map("n", "<Leader>|", ":<C-u>vs<CR>", { desc = "Split vertical" })
map("n", "<Leader>o", "<C-w>w", { desc = "Switch window" })
