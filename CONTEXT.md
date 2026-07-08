# Herdr Tab Title

This context describes the language for the Herdr Tab Title plugin, which keeps Herdr tab labels aligned with pane activity.

## Language

**Herdr Tab**:
A named subcontext inside a Herdr workspace. A tab contains one or more panes and has one visible label in the tab bar.
_Avoid_: window, page

**Herdr Pane**:
A terminal split inside a Herdr tab. A pane owns the shell or foreground program used to derive a tab title.
_Avoid_: terminal, split

**Tab Title**:
The visible label shown for a Herdr tab in the tab bar.
_Avoid_: tab name, window title

**Managed Tab Label**:
A tab label last set by the plugin and therefore safe for the plugin to update again.
_Avoid_: automatic name

**Manual Tab Label**:
A tab label the user appears to have chosen directly. The plugin preserves manual labels unless explicitly forced.
_Avoid_: custom name
