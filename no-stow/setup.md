Tmux:
1. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Within tmux: `prefix+I` to install plugins.

GNOME:
1. `dconf load /org/gnome/desktop/wm/keybindings/ < gnome-wm-shortcuts.ini`
2. `dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome-media-shortcuts.ini`

(note that this does not remove the default keybindings that are in conflict with these settings)
