# Neovim Dotfiles Cheat Sheet

Commands written with `:` may be opened with `Space` in Normal mode.

## Custom keys

| Key | Action |
| --- | --- |
| `Space` | Open the `:` command line |
| `,/` | Clear visible search highlighting |
| `Ctrl-n` | Toggle nvim-tree |
| `Ctrl-h` | Move to the left split |
| `Ctrl-j` | Move to the lower split |
| `Ctrl-k` | Move to the upper split |
| `Ctrl-l` | Move to the right split |

Vertical splits open to the right. Horizontal splits open below.

## Configured editing behavior

- Searches ignore case unless the pattern contains an uppercase letter
- Long lines do not wrap
- The current line is highlighted
- Three lines of context remain visible above and below the cursor while scrolling
- Tabs entered during editing become spaces
- Indentation and soft-tab width are four spaces
- Tabs appear as `›`; trailing spaces appear as `•`
- Trailing whitespace is removed automatically whenever a file is saved
- Backup files, swap files, and persistent undo history are stored outside projects
- Git commit-message buffers start with the cursor on the first line

## Indentation and whitespace repair

| Command | Action |
| --- | --- |
| `>>` / `<<` | Indent/unindent the current line |
| `=` | Reindent a motion or visual selection |
| `gg=G` | Reindent the entire file using its detected filetype |
| `:retab` | Convert literal tabs using the current tab settings |
| `:set list!` | Toggle visible whitespace |
| `:set expandtab?` | Check whether Tab inserts spaces |
| `:set shiftwidth?` | Check indentation width |
| `:set softtabstop?` | Check soft-tab editing width |
| `:set tabstop?` | Check the display width of literal tabs |

After `:retab` or `gg=G`, save and inspect the changes before committing:

```vim
:Git diff
```

## nvim-tree

| Key | Action |
| --- | --- |
| `Ctrl-n` | Open or close the tree |
| `Enter` | Open the selected entry and close the tree |

The tree uses Nerd Font icons and opens at a width of 30 columns.

## Live Markdown preview

| Command | Action |
| --- | --- |
| `:LivePreview start` | Preview the current Markdown file in the default browser |
| `:LivePreview close` | Stop the local preview server |
| `:checkhealth livepreview` | Check Live Preview and show its configuration |

Markdown updates in the browser while editing. `:LivePreview close` stops the server but does not close the browser tab; close the tab manually.

## nvim-surround

| Command | Action |
| --- | --- |
| `ysiw"` | Surround the current word with double quotes |
| `ysiw)` | Surround the current word with parentheses |
| `ds"` | Delete surrounding double quotes |
| `cs"'` | Change surrounding double quotes to single quotes |

Pattern:

```text
ys{motion}{character}  add surroundings
ds{character}          delete surroundings
cs{old}{new}           change surroundings
```

## SuperCollider with scnvim

scnvim loads only for `.sc` and `.scd` files.

| Key or command | Action |
| --- | --- |
| `,st` | Start sclang |
| `,sk` | Recompile the SuperCollider class library |
| `,sb` | Boot the audio server |
| `,sm` | Open the server meter and keep it visible |
| `Alt-e` | Evaluate the current line |
| `Ctrl-e` | Evaluate the surrounding block |
| `Ctrl-e` in Visual mode | Evaluate the selection |
| `Enter` | Toggle the Post window |
| `Alt-l` | Clear the Post window |
| `,k` | Show the function signature at the cursor |
| `,.` | Emergency stop |
| `:SCNvimStop` | Stop sclang |
| `:SCNvimGenerateAssets` | Regenerate machine-local tags, syntax data, and snippets |

Generated assets and the SuperCollider extension junction are machine-local and are not stored in the repository.

## Git with Fugitive

Fugitive operates on the Git repository containing the current file.

| Command | Action |
| --- | --- |
| `:Git` | Open Git status |
| `:Git diff` | Show the working-tree diff |
| `:Git log` | Show commit history |
| `:Git blame` | Show line-by-line blame |
| `:Git commit` | Create a commit |
| `:Git push` | Push through the configured Git remote |

Use the help shown inside Fugitive's status window for its buffer-local keys.

## Lazy plugin manager

| Command | Action |
| --- | --- |
| `:Lazy` | Open the plugin manager |
| `:Lazy sync` | Install missing plugins, update, and clean |
| `:Lazy restore` | Restore versions recorded in `lazy-lock.json` |
| `:checkhealth lazy` | Check Lazy and its dependencies |
| `:checkhealth` | Run all Neovim and plugin health checks |

Plugin updates change `nvim/lazy-lock.json`; review and commit that file with intentional updates.

LuaRocks integration is disabled because the current plugins do not require it. Ripgrep is optional and is not currently installed on Windows.

## Configuration files

| Path | Purpose |
| --- | --- |
| `nvim/init.lua` | Shared editor settings, recovery paths, and Lazy bootstrap |
| `nvim/lua/config/keymaps.lua` | General key mappings |
| `nvim/lua/config/autocmds.lua` | Automatic editor events |
| `nvim/lua/plugins/init.lua` | Plugin specifications and settings |
| `nvim/lazy-lock.json` | Exact installed plugin revisions |

Show the active configuration file:

```vim
:lua print(vim.fn.stdpath("config"))
```

Show machine-local plugin and recovery locations:

```vim
:lua print(vim.fn.stdpath("data"))
:lua print(vim.fn.stdpath("state"))
```

Plugins and recovery files belong in these machine-local directories, not in the repository.

## Repository maintenance

Check the current branch and working tree:

```text
git status
git log --oneline --decorate -5
```

Validate configuration startup and whitespace:

```text
nvim --headless "+qa"
git diff --check
```

Load the repository configuration directly, without relying on an installed link:

```text
nvim -u ./nvim/init.lua --headless "+qa"
```
