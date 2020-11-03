mkcd(){
    mkdir $1 && cd $1
}

logout(){
	pkill x
}
s(){
	echo "Are you sure that you want to shut down your computer?"
		read answer
		if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
			doas shutdown -P now
				fi
}

