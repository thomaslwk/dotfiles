#!/bin/bash

# Define the number of workspaces (Adjust if needed)
NUM_WORKSPACES=6

# Workspace navigation (Alt + 1-9)
for i in $(seq 1 $NUM_WORKSPACES); do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$((i)) "['<Alt>$i']"
done

# Move active window to workspace (Alt + Shift + 1-9)
for i in $(seq 1 $NUM_WORKSPACES); do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$((i)) "['<Alt><Shift>$i']"
done

# Window management shortcuts (similar to i3)
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"            # Close window
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Alt>f']"         # Toggle fullscreen
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Alt>m']"         # Minimize window
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>t']" # Toggle maximized state

# Application Launcher (Alt + Space for rofi/dmenu)
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "['<Alt>space']"
