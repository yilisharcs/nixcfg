vim.keymap.set("i", ",gnu", "<ESC>ggdG:0read ~/.config/nvim/skeletons/license/gpl-3.0.txt | $d_<CR>gg")
vim.keymap.set("i", ",lorem", "<ESC>:read ~/.config/nvim/skeletons/lorem/ipsum.txt<CR>o")
vim.keymap.set("i", ",nix", "<ESC>ggdG:0read ~/.config/nvim/skeletons/flakes/default.nix | $d_<CR>O")
