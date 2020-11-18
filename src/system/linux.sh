mkcd(){
    mkdir $1 && cd $1
}

mnt(){
  sudo mount /dev/sdc ~/Drives/usb
}
umnt(){
  sudo umount ~/Drives/usb
}

s(){
	echo "Are you sure that you want to shut down your computer?"
		read answer
		if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
			sudo shutdown -P now
				fi
}

