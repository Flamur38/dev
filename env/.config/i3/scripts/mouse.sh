# ~/.config/i3/scripts/mouse.sh
#!/bin/bash
for id in $(xinput list --id-only); do
    xinput set-prop "$id" "libinput Accel Speed" 0.8 2>/dev/null
done
