if vim.g.neovide then
	-- Neovide settings
	vim.keymap.set({ "n", "v", "x" }, "<D-v>", "+P")
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli')
	vim.g.neovide_cursor_animation_length = 0.15
	vim.g.neovide_cursor_trail_size = 0.8
	-- vim.g.neovide_scroll_animation_length = 0.25
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_profiler = false
	vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end
