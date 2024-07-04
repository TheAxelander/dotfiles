# Hyprland

## Required packages

```
kitty
btop
brightnessctl
file-roller
gvfs
gvfs-smb
mako
network-manager-applet
swww
thunar
thunar-volman
waybar
wofi
wlogout
noto-fonts-emoji
ttf-jetbrains-mono-nerd
```

Not sure about these yet: 

```
lxappearance
xfce4-settings
xdg-desktop-portal-hyprland-git
```

Execute then below commands:

``` bash
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita-dark"
```