mkcd(){
    mkdir $1 && cd $1
}

mnt(){
  sudo mount /dev/sdc ~/Drives/usb
}
umnt(){
  sudo umount ~/Drives/usb
}
smv(){
  sudo mv $1 $2 $3 $4 $5 $6 $7 $8 $9
}
s(){
	echo "Are you sure that you want to shut down your computer?"
		read answer
		if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
			sudo shutdown -P now
				fi
}

