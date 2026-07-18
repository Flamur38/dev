
# how to install new tool:

```bash
sudo apt install terminator

mkdir -p ~/projects/dev/terminator/.config/terminator
# configure terminator first, then:
cp ~/.config/terminator/config ~/projects/dev/terminator/.config/terminator/config
stow -d ~/projects/dev -t ~ terminator
```



