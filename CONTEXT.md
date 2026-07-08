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
A tab label the user appears to have chosen directly. The plugin preserves manual label text unless explicitly forced, but may normalize display chrome such as the visual tab index prefix.
_Avoid_: custom name

**Directory Depth**:
The number of trailing cwd path components used when deriving a tab title from an idle shell. A depth of 1 uses only the leaf directory; a depth of 2 uses parent/leaf.
_Avoid_: path length

**Visual Tab Index**:
The 1-based tab position shown in Herdr's tab bar and used by indexed navigation like prefix+1..9. This is distinct from Herdr's stable public tab number.
_Avoid_: public tab number
