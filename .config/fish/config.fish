if uwsm check may-start
    exec uwsm start hyprland.desktop
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias hdmi-mirror="hyprctl keyword monitor HDMI-A-1,highres,auto,1,mirror,eDP-1"
    alias hdmi-extend-right="hyprctl keyword monitor HDMI-A-1,3840x2160,0x0,1"
    alias hdmi-extend-left="hyprctl keyword monitor HDMI-A-1,3840x2160,-1920x0,1"
end

# Theme
starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/bkorecic/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
