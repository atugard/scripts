ipkg(){
  echo "From arch repos or AUR? (r for arch repos, a for AUR)"
  read input
  if [[ $input == r ]]; then
    sudo aura -S $1
  elif [[ $input == a ]]; then 
    sudo aura -A $1
  else
    echo "Sorry, unrecognized answer. Quitting..."
  fi
}

rpkg(){
  doas pacman -R $1
}

uapkg(){
  sudo aura -Au
}
uspkg(){
  sudo aura -Syu
}
upkg(){
  uspkg && uapkg
}
#upkg(){
#  sudo aura -Akuax
#}

qapkg(){
  sudo aura -Ai $1
}

lpkg(){
  sudo aura -L
}




