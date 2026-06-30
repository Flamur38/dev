# dev

Personal Linux development environment for Ubuntu 24.04 + i3, managed with GNU Stow.
Each top-level folder is a stow package that mirrors its target path under `$HOME` — symlinked, not copied, so editing a file in this repo edits the live config directly.

## Stack

- i3 window manager + polybar + rofi
- Neovim (lazy.nvim, custom colorschemes, LSP)
- tmux
- zsh + oh-my-zsh
- ghostty (terminal)

## Repo structure
~/projects/dev/
├── install              # stow loop — symlinks everything into $HOME
├── run                  # runner for runs/ scripts
├── runs/                # first-time install scripts (packages, tools)
├── nvim/.config/nvim/
├── tmux/.tmux.conf
├── zsh/.zshrc
│   └── .zsh_profile
├── i3/.config/i3/
├── ghostty/.config/ghostty/
├── polybar/.config/polybar/
├── rofi/.config/rofi/
└── x11/.xinitrc, .xprofile, .Xresources

## Home directory layout
~
├── projects/            # long-lived dev work
│   ├── dev/             # this repo
│   ├── Python/          # python learning (Flamur38/Python)
│   └── harpoon/         # neovim plugin reference
├── lab/                 # blue-team exercises (HTB, BTL1, pcaps, evtx)
│   ├── notes/
│   ├── tools/
│   └── transfer/
└── .dev-personal/       # private — notes, env vars, sensitive config

## Setup on a new machine

```bash
sudo apt install git stow
git clone git@github.com:Flamur38/dev.git ~/projects/dev
cd ~/projects/dev

# install packages and tools
./run base-system

# symlink all configs into $HOME
./install
```

`install` is idempotent — safe to re-run any time.

## Adding a new config package

```bash
mkdir -p ~/projects/dev/newtool/.config/newtool
cp -r ~/.config/newtool/* ~/projects/dev/newtool/.config/newtool/
rm -rf ~/.config/newtool
stow -d ~/projects/dev -t ~ newtool
```

Then add `newtool` to `STOW_FOLDERS` in `install`.

## Requirements

- Ubuntu 24.04 (Debian-based)
- `git`, `stow`, `curl`

## License

MIT
