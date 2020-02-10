latex_build(){
    perl ~/tools/scripts/latex_build/latex_build.pl $1
}

define(){perl ~/tools/scripts/define/define.pl $1}


cs(){perl ~/tools/scripts/cs_function/cs.pl}

cs_config(){$EDITOR ~/tools/scripts/cs_function/cs.pl}

s(){
    echo "Are you sure that you want to shut down your computer?"
    read answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        shutdown now
    fi
    if [ "$answer" = "no" ] || [ "$answer" = "n" ]; then
        echo "Saved your ass. HEEEEEEEEEEEEEEEEEEEEE."
    fi
}

#Change this function to search for config files in ~/dotfiles/* rather than ~/.config/*, since these are symbolically linked to the latter anyway.
config(){
    echo "Which config file do you want to open?"
    read answer
    if [ "$answer" = "i3" ]; then
        $EDITOR ~/dotfiles/i3/config
    elif [ "$answer" = "picom" ]; then
        $EDITOR ~/dotfiles/picom/picom.conf
    elif [ "$answer" = "dunst" ]; then
        $EDITOR ~/dotfiles/dunst/dunstrc
    elif [ "$answer" = "vim" ]; then
        $EDITOR ~/dotfiles/vim/.vimrc
    elif [ "$answer" = "zsh" ]; then
        $EDITOR ~/dotfiles/zsh/.zshrc
    elif [ "$answer" = "rofi" ]; then
        $EDITOR ~/dotfiles/rofi/config
    elif [ "$answer" = "polybar" ]; then
        $EDITOR ~/dotfiles/polybar/config
    elif [ "$answer" = "bspwm" ]; then
        $EDITOR ~/dotfiles/bspwm/bspwmrc
    elif [ "$answer" = "bindings" ]; then
        $EDITOR ~/dotfiles/sxhkd/sxhkdrc
    elif [ "$answer" = "st" ]; then
        $EDITOR ~/dotfiles/st/config.h
    else
        echo "Sorry, couldn't find a config file in reference to the name $answer !"
    fi
}

reset(){
    #> /dev/null sends output to the null device
    #&1 is File descriptor 1 is the standard output (stdout)
    #2 is the standard error (stderr)
    #% has syntax of file descriptors only in context of redirections, i.e. after >
    ~/.config/bspwm/bspwmrc > /dev/null 2>&1
}

logout(){pkill x}
p(){bluetoothctl pair $beats_id}
c(){bluetoothctl connect $beats_id}
en(){setxkbmap -layout us}
fr(){setxkbmap -layout ca -variant fr}

scs(){ dir=`du -a ~/Dropbox/computer_science/ | awk '{print $2}' | fzf `; $EDITOR $dir}
sh(){ dir=`du -a ~/ | awk '{print $2}' | fzf `; $EDITOR $dir};
