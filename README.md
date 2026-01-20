# 💻 dev-env    

A modular, portable Bash-based development environment setup. This project helps you quickly configure and personalize your Linux environment with:

- ⚙️ i3 Window Manager
- 🧠 Neovim (Lua-based config)
- 📊 i3status
- 🧵 Tmux
- 🐚 ZSH
- 🛠️ Tools & CLI utilities

---

## 📁 Project Structure

```bash
.
├── configs/            # Dotfiles and configuration folders
│   ├── .config/
│   │   ├── i3/
│   │   ├── i3status/
│   │   └── nvim/
│   ├── .tmux.conf
│   ├── .xinitrc
│   ├── .xprofile
│   ├── .Xresources
│   ├── .zsh_profile
│   └── .zshrc
├── dev-env/            # (Reserved for shared logic/scripts)
├── run/                # (Optional: single-run setup logic)
└── runs/               # Setup scripts for individual components
    ├── i3-rofi
    ├── neovim
    ├── tmux
    ├── tools
    └── zsh
```

---

## 🚀 Getting Started

Clone the repo:

```bash
git clone https://github.com/Flamur38/BASH.git
cd BASH 
```

Run the setup scripts

```bash
chmod +x runs/*
./runs/tools      # Install core tools
./runs/zsh        # Setup ZSH and plugins
./runs/neovim     # Setup Neovim with custom config
./runs/tmux       # Tmux + config
./runs/i3-rofi    # i3, i3status, rofi, etc.
```

---

## 🛠 Requirements

- Linux (Debian/Ubuntu-based preferred.)
- `git`, `curl`, `wget`
- Superuser privileges (`sudo`)

---

## 📦 Coming Soon

- 🐧 Setup scripts for GNOME, XFCE
- 🧰 Optional install flags
- 🧪 Testing in Docker.

---

## 📜 License

MIT — do whatever you want, just don’t blame me if it breaks stuff. 😄

---

> Made with ❤️ by Flamur
> Inpired by the great ThePrimeAgen
# mul1x-dev
