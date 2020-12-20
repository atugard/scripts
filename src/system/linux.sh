mnt(){
  sudo mount /dev/sdc ~/Drives/usb
}
umnt(){
  sudo umount ~/Drives/usb
}
search(){
  sudo find / -name "*$1*"
}
s(){
	echo "Are you sure that you want to shut down your computer?"
		read answer
		if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
			sudo shutdown -P now
				fi
}

temp(){
  watch -n 1 sensors 
}
