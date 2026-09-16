# COSMIC config (staged — not active until COSMIC is installed)

Ported from KDE: `.config/kglobalshortcutsrc`, `.config/kwinrc`, `~/.config/kxkbrc`.
These are [cosmic-config](https://github.com/pop-os/cosmic-comp) key files — one
file per key, contents are a bare RON value.

| File | Key |
|---|---|
| `com.system76.CosmicSettings.Shortcuts/v1/custom` | user shortcut overrides, merged over `defaults` |
| `com.system76.CosmicComp/v1/xkb_config` | layouts (`us,ua` / `colemak,`) |
| `com.system76.CosmicComp/v1/workspaces` | `Horizontal` strip, matching KDE's `Rows=1` |

## Manual steps after first login

1. **Pin four workspaces.** COSMIC has no workspace-count setting; empty
   workspaces are garbage-collected by `ensure_last_empty()`, and only `pinned`
   ones are exempt. Right-click each workspace in the overview → Pin. The
   compositor then persists them to `com.system76.CosmicComp/v1/pinned_workspaces`,
   which can be committed here afterwards. Expect 4 pinned + 1 trailing scratch.
2. **Verify kanata still grabs the keyboard** under the COSMIC session.
3. Screenshots land in `~/Pictures/Screenshots` (already exists).

## Did not port — no COSMIC equivalent

Checked against the `Action`/`System` enums in `cosmic-settings-daemon`
(`config/src/shortcuts/action.rs`); these have no action to bind to:

- `Meta+D` peek at desktop
- `Meta+0` zoom to actual size (only `ZoomIn`/`ZoomOut` exist)
- `Alt+Esc` cycle windows of the current application
- `Ctrl+F7/F9/F10` Expose / Present Windows variants (only `WorkspaceOverview`)
- `Meta+Ctrl+Esc` kill window
- `Meta+1..9` activate task-manager entry N
- `Meta+Shift+Space` switch to *last-used* layout — only `InputSourceSwitch`
  (cycle), which is equivalent with two layouts
- KWin custom tile layout (25/50/25). COSMIC autotiles instead; `Super+y`
  (physical `o` under Colemak) toggles tiling per workspace.

Also note `Super+.` is COSMIC's `ZoomIn` by default and is taken here for the
emoji picker; zoom remains on `Super+=` / `Super+-`.

## Open decision: kanata navig layer

`.config/kanata/kanatarc` `navig` emits two chords whose meaning changes:

| navig key (physical) | emits | KDE meaning | COSMIC default |
|---|---|---|---|
| `u` / `p` | `S-M-left` / `S-M-right` | switch desktop L/R | `Move(Left/Right)` |
| `h` / `'` | `M-left` / `M-right` | quick-tile L/R | `Focus(Left/Right)` |

The first is **handled** — `custom` rebinds `Super+Shift+Left/Right` to
`PreviousWorkspace`/`NextWorkspace`, so no kanata change is needed.

The second is **left alone deliberately**: quick-tile-to-half has no real analog
in an autotiling compositor, and `Focus(Left/Right)` is the higher-frequency
operation. If the muscle memory turns out to matter more, change those two
`navig` entries in `kanatarc` rather than the RON.
