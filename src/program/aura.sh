ipkg(){
  echo "From arch repos or AUR? (r for arch repos, a for AUR)"
  read input
  if [[ $input == r ]]; then
    sudo pacman -S $1
  elif [[ $input == a ]]; then 
    yay $1
  else
    echo "Sorry, unrecognized answer. Quitting..."
  fi
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

rpkg(){
  sudo aura -R $1
}


#packagelog
lpkg(){
  sudo aura -L
}

#remove orphans
cpkg(){
  packages=$(aura -O)
  if [[ "$packages" == "" ]]; then
    echo "No orphaned pkgs to remove."
  else
    sudo aura -R $(aura -O)
  fi
}




