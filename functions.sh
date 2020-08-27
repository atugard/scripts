s(){
    echo "Are you sure that you want to shut down your computer?"
    read answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        doas shutdown -P now
    fi
}

logout(){pkill x}

c(){bluetoothctl connect $beats_id}

ed(){doas vim $1}

vol(){ pulsemixer }

up(){ doas pacman -Syu }

mec(){ cd ~/Dropbox/Physics/ClassicalMechanics; mechanics --load "sicm.rkt"
     }

git_sync() {
    rm -rf $1 && git clone https://github.com/atugard/$1
}
yta() {
    mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}
ytv() {
    mpv ytdl://ytsearch:"$*" 2&>/dev/null & disown
}

install(){
	doas pacman -S $1
}
clean(){
	doas pacman -Rns $(pacman -Qtdq)
}
