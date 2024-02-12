-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.cmd([[
    nnoremap <silent>       <c-h> <cmd>lua require('tmux').move_left()<cr>
    nnoremap <silent><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "<cmd>lua require('tmux').move_bottom()<cr>"
    nnoremap <silent><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "<cmd>lua require('tmux').move_top()<cr>"
    nnoremap <silent>       <c-l> <cmd>lua require('tmux').move_right()<cr>

    tnoremap <silent>       <c-h> <c-\><c-n><cmd>lua require('tmux').move_left()<cr>
    tnoremap <silent>       <c-j> <c-\><c-n><cmd>lua require('tmux').move_bottom()<cr>
    tnoremap <silent>       <c-k> <c-\><c-n><cmd>lua require('tmux').move_top()<cr>
    tnoremap <silent>       <c-l> <c-\><c-n><cmd>lua require('tmux').move_right()<cr>

    nnoremap <silent>       <m-h> <cmd>lua require('tmux').resize_left()<cr>
    nnoremap <silent>       <m-j> <cmd>lua require('tmux').resize_bottom()<cr>
    nnoremap <silent>       <m-k> <cmd>lua require('tmux').resize_top()<cr>
    nnoremap <silent>       <m-l> <cmd>lua require('tmux').resize_right()<cr>

    tnoremap <silent>       <m-h> <c-\><c-n><cmd>lua require('tmux').resize_left()<cr>
    tnoremap <silent>       <m-j> <c-\><c-n><cmd>lua require('tmux').resize_bottom()<cr>
    tnoremap <silent>       <m-k> <c-\><c-n><cmd>lua require('tmux').resize_top()<cr>
    tnoremap <silent>       <m-l> <c-\><c-n><cmd>lua require('tmux').resize_right()<cr>
]])
-- esc with jk
local map = vim.keymap.set
--
map({ "i" }, "jk", "<esc>", { desc = "Escape" })
