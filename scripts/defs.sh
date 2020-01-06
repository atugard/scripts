function latex_build {
    perl ~/tools/scripts/latex_build/latex_build.pl $1
}

function define {
    perl ~/tools/scripts/define/define.pl $1
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

function search {
    if [[ $# -eq 0 ]]; then
        echo "You have to pass at least one argument!"
    elif [[ $# -eq 1 ]]; then
        < $1
    elif [[ $# -eq 2 ]]; then
        < $1 grep -i $2
    else
        echo "You can pass at most two arguments!"
    fi
}
    



#Change this function to search for config files in ~/dotfiles/* rather than ~/.config/*, since these are symbolically linked to the latter anyway.
function config {
    echo "Which config file do you want to open?"
    read answer
    if [ "$answer" = "i3" ]; then
        vim ~/.config/i3/config
    elif [ "$answer" = "picom" ]; then
        vim ~/.config/picom/picom.conf
    elif [ "$answer" = "dunst" ]; then
        vim ~/.config/dunst/dunstrc
    elif [ "$answer" = "vim" ]; then
        vim ~/.vimrc
    elif [ "$answer" = "zsh" ]; then
        vim ~/.zshrc
    elif [ "$answer" = "rofi" ]; then
        vim ~/.config/rofi/config
    elif [ "$answer" = "polybar" ]; then
        vim ~/.config/polybar/config_top.ini
    else
        echo "Sorry, couldn't find a config file in reference to the name $answer !"
    fi
}


