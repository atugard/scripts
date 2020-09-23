pkg(){
	doas pacman $1 $2
}
upkg(){
	doas pacman -Syu 
}
cpkg(){
	doas pacman -Rns $(pacman -Qtdq)
}
ipkg(){
	doas pacman -S $1
}
rpkg(){
	doas pacman -R $1
}
qpkg(){
	doas pacman -Q | grep $1
}

