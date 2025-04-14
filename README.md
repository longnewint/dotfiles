## dnf package manager config /etc/dnf/dnf.conf
fastestmirror=True
defaultyes=True
keepcache=True

## install extra apps
sudo dnf install chromium evince mpv neovim nnn rofi i3lock sxiv

## install extra system utils
sudo dnf install bat btop fastfetch fd-find fzf git hwinfo ncdu tldr tmux wmctrl xrandr zoxide

## install fonts
sudo dnf install dejavu-fonts-all liberation-fonts-common bitstream-vera-fonts-all source-foundry-hack-fonts rsms-inter-fonts google-roboto-fonts google-noto-fonts-common google-noto-sans-cjk-fonts lato-fonts google-rubik-fonts

0xProto

## set default xfce themes and icons
xfconf-query -c xsettings -p /Net/ThemeName -s ""
fconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
xfconf-query -c xfwm4 -p /general/theme -s "Default"

## set i3lock as the default lock program and enable lock on suspend
xfconf-query --create -c xfce4-session -p /general/LockCommand -t string -s "i3lock"
xfconf-query --create -c xfce4-power-manager -p /xfce4-power-manager/lock-screen-suspend-hibernate -s true

## find pulse audio plugin number
xfconf-query -c xfce4-panel -lv | grep pulseaudio

## change volume step to 3 with plugin number 8
xfconf-query -c xfce4-panel -p /plugins/plugin-8/volume-step --create -t int -s 3

## change font setting of power manager plugin on xfce panel(~/.config/gtk-3.0/gtk.css)
#xfce4-power-manager-plugin {
	font-family: 'Inter SemiBold';
	font-size: 16px;
}

## fixing backlight issues with kernel parameters
Edit file /etc/default/grub
Add acpi_backlight=vendor to GRUB_CMDLINE_LINUX

## update new grub config
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

## increase console font size https://martin.rpdev.net/2017/01/21/setting-console-font-size-on-hidpi-screens-in-fedora.html
https://blog.wxm.be/2014/08/29/increase-font-in-grub-for-high-dpi.html

## xdg config @ /etc/security/pam_env.conf
XDG_DATA_HOME DEFAULT=@{HOME}/.local/share
XDG_STATE_HOME DEFAULT=@{HOME}/.local/state

## clean home dir

xrdb -load ~/.config/X11/Xresources
### zsh

### postgres
export PSQLRC="$XDG_CONFIG_HOME/psql/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
### other
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

## change console font to spleen
sudo cp spleen-12x24.psfu /lib/kbd/consolefonts

sudo -e /etc/vconsole.conf
FONT="spleen-12x24"

sudo dracut -f

## mpv config
https://github.com/hl2guide/better-mpv-config
https://github.com/Zabooby/mpv-config

