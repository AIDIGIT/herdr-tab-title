# Herdr Tab Title

Automatic tmux-like tab titles for [Herdr](https://herdr.dev).

This plugin keeps Herdr tab labels in sync with the focused pane in each tab:

- foreground program and directory: `vim herdr`, `cargo api`, `node web`
- idle shell and directory: `zsh herdr`, `fish api`

It uses only public Herdr plugin and CLI APIs. It does not patch Herdr.

## Install

```bash
herdr plugin install aarsh21/herdr-tab-title
herdr plugin action invoke aarsh21.tab-title.start
```

To stop Herdr asking for a tab name before each new tab, set this in
`~/.config/herdr/config.toml`:

```toml
[ui]
prompt_new_tab_name = false
```

Then reload Herdr config:

```bash
herdr server reload-config
```

## Configuration

Plugin configuration lives in the directory printed by:

```bash
herdr plugin config-dir aarsh21.tab-title
```

Create or edit `config.toml` there:

```toml
interval_seconds = 10
directory_depth = 2
show_tab_number = true
```

`interval_seconds` controls the fallback poll. Normal workspace, tab, and pane
events trigger an immediate debounced sync, so titles update without waiting for
the next poll. The default fallback is `10` seconds.

`directory_depth` controls how many trailing path components are shown. The
default is `1`, so a shell in `/home/me/api` displays as `zsh api`; `2` displays
it as `zsh me/api`. Foreground programs still win, so running `vim` there is
titled `vim api`.

`show_tab_number` prefixes tab titles with the visual tab index used by
`prefix+1..9`, such as `1:me/api`. Manual titles keep their text and get the
same prefix. It defaults to `false`.

## Actions

```bash
herdr plugin action invoke aarsh21.tab-title.start
herdr plugin action invoke aarsh21.tab-title.stop
herdr plugin action invoke aarsh21.tab-title.status
herdr plugin action invoke aarsh21.tab-title.sync
```

The watcher refreshes titles immediately from normal workspace, tab, and pane
events, with a 250ms debounce for event bursts. It also runs a fallback refresh
every `interval_seconds`. Watcher and label state is isolated per named Herdr
session, so multiple sessions can update independently.

## Manual Tab Names

Manual tab names are respected by default. The plugin manages tabs that still
have Herdr's generated numeric labels, or tabs whose current label matches the
last label the plugin set.

To overwrite manual names for one run:

```bash
bin/herdr-tab-title sync --force
bin/herdr-tab-title start --force
```

## Development

```bash
cargo test
cargo build --release
herdr plugin link .
herdr plugin action invoke aarsh21.tab-title.start
```

Local `plugin link` does not run build steps. Run `cargo build --release` and
copy the binary to `bin/herdr-tab-title`, or run `scripts/install-binary.sh`,
before linking.
