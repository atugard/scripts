mnt(){
  sudo mount /dev/sdc ~/Drives/usb
}
umnt(){
  sudo umount ~/Drives/usb
}
search(){
  if [[ $# == 0 ]]; then
    doas find /
  elif [[ $# == 1 ]]; then
    doas find / -name "*$1*" 
  elif [[ $# == 2 ]]; then 
    search $1 | grep $2 
  else
    echo "search takes either 0,1, or 2  arguments. You gave $#."
  fi
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
