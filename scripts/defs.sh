function latex_build {
    perl ~/tools/scripts/latex_build/latex_build.pl $1
}

function define {
    perl ~/tools/scripts/define/define.pl $1
}

function u {
    sudo pacman -Syu
}

function s {
    echo "Are you sure that you want to shut down your computer?"
    read answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        shutdown -now
    fi
    if [ "$answer" = "no" ] || [ "$answer" = "n" ]; then
        echo "Saved your ass. HEEEEEEEEEEEEEEEEEEEEE."
    fi
}


