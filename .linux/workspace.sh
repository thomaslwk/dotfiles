#!/bin/bash

NUM_WORKSPACES=6

# Workspace navigation 
for i in $(seq 1 $NUM_WORKSPACES); do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$((i)) "['<Alt>$i']"
done

# Move active window to workspace 
for i in $(seq 1 $NUM_WORKSPACES); do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$((i)) "['<Alt><Shift>$i']"
done

# Window management shortcuts 
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"            # Close window
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Alt>f']"         # Toggle fullscreen
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Alt>m']"         # Minimize window
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>t']" # Toggle maximized state

# Move to workspace left and right
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Alt>a']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Alt>s']"

# Application Launcher (Alt + Space for rofi/dmenu)
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "['<Alt>space']"
