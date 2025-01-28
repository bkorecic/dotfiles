function theme
    set alacritty "$HOME/.config/alacritty/themes"
    set nvim "$HOME/.config/nvim/lua/colorschemes"
    if test $argv[1] = "light"
        ln -sf $alacritty/catppuccin-latte.toml $alacritty/active.toml
        ln -sf $nvim/catppuccin-latte.lua $nvim/active.lua
        touch $alacritty/../alacritty.toml
    else if test $argv[1] = "dark"
        ln -sf $alacritty/catppuccin-frappe.toml $alacritty/active.toml
        ln -sf $nvim/catppuccin-frappe.lua $nvim/active.lua
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias hdmi-mirror="hyprctl keyword monitor HDMI-A-1,highres,auto,1,mirror,eDP-1"
    alias hdmi-extend-right="hyprctl keyword monitor HDMI-A-1,3840x2160,0x0,1"
    alias hdmi-extend-left="hyprctl keyword monitor HDMI-A-1,3840x2160,-1920x0,1"
    alias vim="nvim"
    alias vi="nvim"
    alias v="nvim"
    function code 
        /usr/bin/code --enable-ozone --ozone-platform=wayland $argv &> /dev/null
    end
end

if status is-login
    if test (tty) = /dev/tty1
        exec Hyprland
    end
end

# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions/ $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

