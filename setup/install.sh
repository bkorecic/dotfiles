#!/bin/bash

install() {
    echo "Installing $1"
    if [[ $2 == "python" ]]; then
        pip install --user $1
    elif [[ $2 == "pythonsudo" ]]; then
        sudo pip install $1
    else
        yay -S --needed $1
    fi
}

# install yay
if ! pacman -Qi yay > /dev/null ; then
    echo "Installing yay"
    cd $HOME
    mkdir gitclones
    cd gitclones
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME/dotfiles
fi


# install dependencies
pckgs=('python vim zathura stow bspwm sxhkd inkscape')
python_pckgs=('numpy matplotlib pigments ipython')
python_sudo_pckgs=('ipython')

for pckg in ${pckgs[@]}; do
    install $pckg
done

for pckg in ${python_pckgs[@]}; do
    install $pckg python
done

for pckg in ${python_sudo_pckgs[@]}; do
    install $pckg pythonsudo
done 

# KDE-bspwm XSession

cp plasma-bspwm.desktop /usr/share/xsessions/

# refresh sxhkd keys
pkill -USR1 -x sxhkd

echo "Finished. Reboot is recommended."
