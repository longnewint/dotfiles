## dnf package manager config /etc/dnf/dnf.conf
fastestmirror=True\
defaultyes=True\
keepcache=True

## kde-extra
sudo dnf install kdotool qt

## install zsh
sudo dnf install zsh\
sudo chsh <USER_NAME>

## install extra apps
sudo dnf install ffmpeg ImageMagick poppler\
sudo dnf install calibre chromium kitty mpv neovim qview qbittorrent rofi sxiv

## install extra system utils
sudo dnf install btop duf fastfetch hwinfo ncdu procs tldr wmctrl xrandr

## install dev tools
sudo dnf install bat fd-find fzf git jq ripgrep tmux zoxide

## install fonts
sudo dnf install dejavu-fonts-all liberation-fonts-common bitstream-vera-fonts-all source-foundry-hack-fonts rsms-inter-fonts google-roboto-fonts google-noto-fonts-common google-noto-sans-cjk-fonts lato-fonts google-rubik-fonts

0xProto

## set kde default cursor at /usr/share/icons/default

## fixing backlight issues with kernel parameters
Edit file /etc/default/grub \
Add acpi_backlight=vendor to GRUB_CMDLINE_LINUX

## update new grub config
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

## increase console font size https://martin.rpdev.net/2017/01/21/setting-console-font-size-on-hidpi-screens-in-fedora.html
https://blog.wxm.be/2014/08/29/increase-font-in-grub-for-high-dpi.html

## change console font to spleen
sudo cp spleen-12x24.psfu /lib/kbd/consolefonts

sudo -e /etc/vconsole.conf
FONT="spleen-12x24"

sudo dracut -f

## clean home dir

xrdb -load ~/.config/X11/Xresources
### zsh

### postgres
export PSQLRC="$XDG_CONFIG_HOME/psql/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
### other
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

