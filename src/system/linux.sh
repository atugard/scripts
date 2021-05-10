#TODO : recursive implementation 

__rename (){

}

_rename(){
  array=($1/*)
  setopt nullglob
  for f in $array; do 
    echo $f
    if [[ -d $f ]]; then
      echo  _rename $f $2 $3 
    else
      echo echo "HERE"
    fi
  done
}

rename(){
  array=($1/*)

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

tmp() {
  doas mount -o remount,size=$1G,noatime /tmp
}

line() {
	cat $1 | grep  $2

}

weather() {
    curl wttr.in/Montreal
}
