# Dotfiles

Personal Linux shell/editor/terminal configuration managed in Git.

## Structure

- `zsh/.zshrc`
- `zsh/.p10k.zsh`
- `tmux/.tmux.conf`
- `git/.gitconfig`
- `git/.gitconfig.local.example`
- `kitty/.config/kitty/*`
- `niri/.config/niri/*`

This repo is organized for [`stow`](https://www.gnu.org/software/stow/) so each top-level directory is a package.

## Setup

1. Install GNU Stow.
2. Clone this repo.
3. From the repo root, run:

```bash
stow zsh tmux git kitty niri
```

This will create symlinks in `$HOME` (for example, `~/.zshrc -> dotfiles/zsh/.zshrc`).

## Dependencies

Package names vary by distro, but these are the required components.

### Critical (required)

- `niri` (Wayland compositor)
- `kitty` (terminal)
- `noctalia-shell` (**critical**)
- `quickshell` (provides `qs`, used by Noctalia shell IPC)
- `stow` (to symlink configs)

### Required for this exact config to look/work correctly

- `JetBrainsMono Nerd Font` (kitty font)
- `capitaine-cursors` (cursor theme set in niri config)

### Used by keybinds (install or replace keybind targets)

- `helium-browser`
- `nautilus`
- `spotify`
- `obsidian`
- `discord`

If any of these apps are not installed, edit `niri/.config/niri/cfg/keybinds.kdl` and replace the `spawn` command.

### Helpful extras

- `zsh`
- `powerlevel10k`
- `fzf`
- `zoxide`
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
- `ripgrep` (used via `grep` alias in `.zshrc`)
- `bat` (used via `cat` alias in `.zshrc`)

## Local-only secrets

Keep machine-specific or private values in files that are **not** committed.

- Copy `git/.gitconfig.local.example` to `~/.gitconfig.local`
- Update your private name/email and any machine-specific settings there

## Notes

- Review configs before pushing this repo public.
- Avoid committing API keys/tokens.
