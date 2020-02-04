function latex_build {
    perl ~/tools/scripts/latex_build/latex_build.pl $1
}

function define {
    perl ~/tools/scripts/define/define.pl $1
}

function cs {
    perl ~/tools/scripts/cs_function/cs.pl
}

function cs_config {
    vim ~/tools/scripts/cs_function/cs.pl
}

function s {
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
function config {
    echo "Which config file do you want to open?"
    read answer
    if [ "$answer" = "i3" ]; then
        vim ~/dotfiles/i3/config
    elif [ "$answer" = "picom" ]; then
        vim ~/dotfiles/picom/picom.conf
    elif [ "$answer" = "dunst" ]; then
        vim ~/dotfiles/dunst/dunstrc
    elif [ "$answer" = "vim" ]; then
        vim ~/dotfiles/vim/.vimrc
    elif [ "$answer" = "zsh" ]; then
        vim ~/dotfiles/zsh/.zshrc
    elif [ "$answer" = "rofi" ]; then
        vim ~/dotfiles/rofi/config
    elif [ "$answer" = "polybar" ]; then
        #havent yet symbolically linked polybar correctly yet
        vim ~/.config/polybar/config_top.ini
    elif [ "$answer" = "bspwm" ]; then
        vim ~/.config/bspwm/bspwmrc
    elif [ "$answer" = "bindings" ]; then
        vim ~/.config/sxhkd/sxhkdrc
    elif [ "$answer" = "st" ]; then
        vim ~/st-0.8.2/config.h
    else
        echo "Sorry, couldn't find a config file in reference to the name $answer !"
    fi
}

function reset_bspwm {
    ~/.config/bspwm/bspwmrc
}


