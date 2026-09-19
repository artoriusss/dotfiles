Tmux:
1. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Within tmux: `prefix+I` to install plugins.

Herdr (needs 0.8.0+):
`.config/herdr/config.toml` and `.config/herdr/plugins/` are stowed, but the
plugin registry `~/.config/herdr/plugins.json` is not -- it stores absolute
`plugin_root` paths, so it is per-machine and must be rebuilt by re-running the
install/link commands below.

1. Local plugins:
     `herdr plugin link ~/.config/herdr/plugins/workspace-history`
     `herdr plugin link ~/.config/herdr/plugins/session-bootstrap`
   session-bootstrap resets the session on every server launch (herdr always
   restores `~/.config/herdr/session.json` and has no key to stop it) and brings
   the technical `_*` workspaces up with their commands running. It holds off
   when the launch inherited a live session, i.e. `herdr update --handoff`.
   Reset by hand with:
     `herdr plugin action invoke reset --plugin local.session-bootstrap`
2. Remote plugins (checkout is gitignored; herdr clones it into the stowed
   `plugins/github/`, complete with its own nested `.git`):
     `herdr plugin install rohankewal/herdr-nerd-font-tab-name --yes`
   Nerd Font tab icons. Pinned at b5cc7db on 2026-08-14. Needs a Nerd Font in
   the terminal and Python 3.8+. Per-tab config (none written yet, defaults in
   the checkout's `config/defaults.yml`) would go in
   `~/.config/herdr/plugins/config/herdr-nerd-font-tab-name/herdr-nerd-font-tab-name.yml`.
3. Its watcher starts from herdr's `startup` hook, so a running herdr will not
   pick it up until restart. Start it in place with:
     `herdr plugin action invoke restart --plugin herdr-nerd-font-tab-name`
   Also `status` / `refresh` / `stop` (stop restores the original labels).
4. Remote-box accent (so the SSH'd-in herdr is visually distinct from the
   local one at a glance): add `accent = "#cba6f7"` under `[ui]` in the
   remote's `~/.config/herdr/config.toml`, then `herdr server reload-config`
   (or just restart herdr). This is a deliberate local-only edit to a stowed
   file -- do not commit it, and re-add it after any `git checkout` of that
   file on the remote box. Local machine keeps no accent override (theme
   default). There's no live "set accent" API, only config.toml + reload, so
   this stays a manual one-liner rather than a script that self-rewrites the
   tracked config on every launch.

GNOME:
1. `dconf load /org/gnome/desktop/wm/keybindings/ < gnome-wm-shortcuts.ini`
2. `dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome-media-shortcuts.ini`

(note that this does not remove the default keybindings that are in conflict with these settings)

Zoxide (required by `tv` and `sesh`). Add to `.zshrc`:
```eval "$(zoxide init zsh)"```
