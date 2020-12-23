ipkg(){
  echo "From arch repos or AUR? (r for arch repos, a for AUR)"
  read input
  if [[ $input == r ]]; then
    doas pacman -S $1
  elif [[ $input == a ]]; then 
    yay $1
  else
    echo "Sorry, unrecognized answer. Quitting..."
  fi
}
upkg(){
  yay
}

#query package
qpkg(){
  pacman -Qs $1 $2 $3 $4 $5 $6 $7 $8 $9
}

rpkg(){
  flag="-R"

  echo "Remove package( q to quit ),"
  echo "** but keep dependencies                     :   <CR>" 
  echo "** and dependencies.                         :  s<CR>"
  echo "** dependencies, and its group.              : su<CR>"
  echo "** dependencies, and all dependent packages. : sc<CR>"
  echo "** but keep dependent packages.              : dd<CR>"
  echo "** and backup configuration metadata.        :  n<CR>"

  read input

  if [[ $input == q || $input == quit || $input == Q || $input == Quit ]]; then 
    echo "Quitting..."
    return -1
  fi

  if [[ $input == s ]]; then 
    flag="$flag""s"
  elif [[ $input == su ]]; then 
    flag="$flag""su"
  elif [[ $input == sc ]]; then 
    flag="$flag""sc"
  elif [[ $input == dd ]]; then 
    flag="$flag""dd"
  elif [[ $input == n ]]; then 
    flag="$flag""n"
  fi
  doas pacman $flag $1 $2 $3 $4 $5 $6 $7 $8 $9
  return 1 

}

spkg(){
  pacman -Ss $1 $2 $3 $4 $5 $6 $7 $8 $9 
}

opkg(){
  pacman -Qdt
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


mirrors(){
  echo "Fetching mirrors..." &&
    curl -s "https://www.archlinux.org/mirrorlist/?country=${2:-CA}&country=${3:-US}&protocol=https&use_mirror_status=on" | 
    sed -e 's/^#Server/Server/' -e '/^#/d' | 
    rankmirrors -n ${1:-5} - > /tmp/mirrors &&
    sudo cp /tmp/mirrors /etc/pacman.d/mirrorlist &&
    rm /tmp/mirrors &&
    echo "Done!"
  }

linux-tkg(){
  dir=$pwd
  cd /tmp &&
  git clone https://github.com/Frogging-Family/linux-tkg.git &&
  cd linux-tkg &&
  makepkg -si &&
  cd .. &&
  rm -rf linux-tkg  &&
  cd $dir
}

#need to implement a hook for case where use exits midway. 
#the hook should cd back to pwd if clone is not yet complete,
#or else it should delete the cloned directory from tmp and cd back to pwd
rest-tkg(){
  dir=$pwd
  cd /tmp &&
  git clone https://github.com/Frogging-Family/wine-tkg-git.git &&
  cd wine-tkg-git/wine-tkg-git &&
  makepkg -si &&
  cd .. &&
  cd proton-tkg &&
  makepkg -si &&
  cd ../.. &&
  rm -rf wine-tkg-git
  cd $dir
}

update-tkg(){
  linux-tkg && rest-tkg
}
