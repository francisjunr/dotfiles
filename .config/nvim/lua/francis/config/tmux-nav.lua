local status_ok, navigator  = pcall(require, "christoomey/vim-tmux-navigator")
if not status_ok then
	return
end

navigator.setup({})

