Tmux:
1. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Within tmux: `prefix+I` to install plugins.

GNOME:
1. `dconf load /org/gnome/desktop/wm/keybindings/ < gnome-wm-shortcuts.ini`
2. `dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome-media-shortcuts.ini`

(note that this does not remove the default keybindings that are in conflict with these settings)

KDE (Plasma 5.27):
Currently running the Wayland session. Notes below marked X11/Wayland apply only
to that session type. Plan: upgrade to Ubuntu 26.04 (Plasma 6.6) once the LTS
upgrade path opens with 26.04.1 -- see the bottom of this section.

0. Wayland: touchpad is configurable normally via System Settings > Input
   Devices > Touchpad (the X11 misidentification bug in step 1 does not apply).
   Settings land in ~/.config/kcminputrc under
   [Libinput][1267][13100][VEN_04F3:00 04F3:332C Touchpad]. Match the option
   values documented in 30-touchpad.conf.
1. X11 only: `sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/` then log out and back in.
   Needed because the Plasma 5.27 touchpad KCM on X11 misidentifies the Logitech
   USB receiver as the touchpad and writes every change there. Do not use
   System Settings > Input Devices > Touchpad while the receiver is plugged in.
2. Alt+Space -> `vicinae toggle` lives in `~/.config/khotkeysrc` as a
   SIMPLE_ACTION_DATA entry, because Plasma 5 has no `.desktop` command-shortcut
   support (`X-KDE-GlobalAccel-CommandShortcut` is Plasma 6 only, so
   `.local/share/applications/vicinae.desktop` does nothing here and is kept only
   for a future Plasma 6 upgrade).
   KRunner's `_launch` in kglobalshortcutsrc must drop its Alt+Space alternate or
   it wins the chord. Keep `Alt+F2` and `Search`.
   Editing kglobalshortcutsrc by hand requires stopping kglobalaccel first --
   it rewrites the file from memory on exit and will clobber your changes:
     kquitapp5 kglobalaccel && <edit> && setsid /usr/bin/kglobalaccel5 &
3. Set the bottom panel to auto-hide. Not stowed, because plasmashell rewrites
   plasma-org.kde.plasma.desktop-appletsrc constantly. Panel right-click >
   Enter Edit Mode > More Options > Auto Hide, or:
     qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript \
       'panels()[0].hiding = "autohide"'
   Writing panelVisibility=1 into the file directly does not work -- plasmashell
   keeps its own in-memory state and clobbers it. Use the scripting API, which
   applies live and persists the key itself.
4. Known broken on Plasma 5.27 Wayland: vicinae clipboard history. Vicinae's
   clipboard backend speaks only ext-data-control-v1 (upstream PR #627); KWin
   5.27 offers only the older zwlr_data_control_manager_v1, so vicinae loads its
   DummyClipboardServer and silently records nothing. Check with:
     journalctl --user -u vicinae | grep "clipboard server"
     /usr/local/lib/vicinae/usr/libexec/vicinae/vicinae-data-control-server
   Fixed by Plasma 6.6, which ports KWin to ext-data-control (KWin MR !6606).
   Works on the X11 session meanwhile (vicinae has an X11ClipboardServer), and
   worked on GNOME via the separate vicinae GNOME extension backend.

Upgrade path to Plasma 6 (as of 2026-08-09):
- No Plasma 6 exists for 24.04; the Kubuntu backports PPA does not build for
  noble. Do not try to force it -- it means replacing the whole Qt5/KF5 desktop.
- Ubuntu 26.04 has plasma-desktop 6.6.4 in universe, the same component 24.04's
  5.27.12 comes from. So this is a normal LTS->LTS `do-release-upgrade`, not a
  switch to Kubuntu and not a reinstall.
- The upgrade is gated until the 26.04.1 point release. Verify with:
    curl -s https://changelogs.ubuntu.com/meta-release-lts | grep -A3 resolute
  `Supported: 0` means not yet offered. Do not force with -d.
- To de-risk: `apt remove kde-standard` before upgrading, then
  `apt install kde-standard` afterwards. Avoids migrating a live Plasma 5/Qt5
  desktop to Qt6 in place alongside GNOME's ~68 packages.
- 26.04 drops the X11 session entirely, so 30-touchpad.conf becomes dead there
  and the khotkeys shortcut above should move to the
  X-KDE-GlobalAccel-CommandShortcut key in .local/share/applications/vicinae.desktop.
   Default is Always Visible, which means only a fullscreen window hides it --
   so it flashes into view during every virtual-desktop slide animation.

Zoxide (required by `tv` and `sesh`). Add to `.zshrc`:
```eval "$(zoxide init zsh)"```
