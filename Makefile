.PHONY: sync

sync:
	cp -r ~/.config/i3/ ./config/
	cp -r ~/.config/i3status/ ./config/
	cp -r ~/.config/nvim/ ./config/
	cp -r ~/.config/tmux/ ./config/
	cp -r ~/.local/bin/setup ./setup
	cp -r ~/.tmux.conf ./tmux.conf
