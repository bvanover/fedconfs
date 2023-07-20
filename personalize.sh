#!/bin/zsh

# clones the appropriate repo, bvanover/fedconfs
git clone https://github.com/bvanover/fedconfs

# moves the files in bvanover/fedconfs into their appropriate locales, see fedconfs/README.md for more info

mv fedconfs/alacritty .config/
mv fedconfs/hypr .config/
mv fedconfs/rofi .config/
mv fedconfs/spotify-tui .config/

mv fedconfs/dnf.conf /etc/dnf/
mv fedconfs/config etc/xdg/wayland/
mv fedconfs/style.css etc/xdg/wayland/

# makes sure the sys is up to date before installing software
dnf update

# installs flakpak, Discord, Spotify, & Steam
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.valvesoftware.Steam
flatpak install com.discordapp.Discord
flatpak install flathub  com.spotify.Client

# installs alacritty (terminal emulator), swaybg (background/wallpaper tool), rofi (application launcher), & cava (visualizer)
dnf install alacritty swaybg cava rofi

# installs hyprland and required tools from COPR
dnf copr enable solopasha/hyprland
dnf install hyprland hyprshot
dnf install waybar-hyprland

# installs spotify-tui & sublime-text
dnf copr enable atim/spotify-tui
dnf install spotify-tui
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
dnf install sublime-text

# reports to user
echo "All good!"