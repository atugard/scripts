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
  sudo pacman -R $1
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

#query package
qpkg(){
  if [[ $# == 0 ]]; then
    aura -Q
  elif [[ $# == 1 ]]; then
    aura -Q | grep $1
  else
    echo "qpkg takes either 0 or 1 argument. You gave $#."
  fi
}

#packagelog
lpkg(){
  sudo aura -L
}

#remove orphans
cpkg(){
  sudo aura -R $(aura -O)
}




