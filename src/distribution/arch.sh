ipkg(){
  echo "From arch repos or AUR? (r for arch repos, a for AUR, q to Quit),"
  read input
  if [[ $input == r ]]; then
    doas pacman -S $1
  elif [[ $input == a ]]; then 
      yay $1
  elif [[ $input == q ]]; then
      echo "Okay, quitting."
  else
      echo "Sorry, unrecognized answer."
      ipkg $1
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

  if [[ "$input" == "" || $input == s || $input == su || $input == sc || $input == dd || $input == n ]]; then 
    flag="$flag$input"
  else 
    echo "Sorry, didn't recognize that option"
    echo "Quitting... "
    return -1 
  fi

  doas pacman $flag $1 $2 $3 $4 $5 $6 $7 $8 $9
  return 1 

}
cpkg(){
  flag="-c"
  echo "Remove all( q to quit ),"
  echo "** files from cache:                                                           Sc"
  echo "** cached packages that are not currently installed, and unused sync database: S"

  read input

  if [[ $input == q || $input == quit || $input == Q || $input == Quit ]]; then 
    echo "Quitting..."
    return -1
  fi
  if [[ $input == S || $input == Sc ]]; then 
    flag="$flag$input"
  else 
    echo "Sorry, didn't recognize that option"
    echo "Quitting... "
    return -1 
  fi

  doas pacman $flag
  return 1 

}
spkg(){
  pacman -Ss $1 $2 $3 $4 $5 $6 $7 $8 $9 
}

olpkg(){
  pacman -Qdtq
}

#remove orphans
opkg(){
  orphans=$(olpkg)
  if [[ $orphans == "" ]]; then 
    echo "No orphans found"
    return -1
  fi

  doas pacman -Rns $orphans
  return 1 

}


mirrors(){
  echo "Fetching mirrors..." &&
    curl -s "https://archlinux.org/mirrorlist/?country=${2:-CA}&country=${3:-US}&protocol=https&use_mirror_status=on" |
    sed -e 's/^#Server/Server/' -e '/^#/d' | 
    rankmirrors -n ${1:-5} - > /tmp/mirrors &&
    if [ -s /tmp/mirrors ]; then 
      sudo cp /tmp/mirrors /etc/pacman.d/mirrorlist &&
        rm /tmp/mirrors &&
        echo "Done!"
              return 1
            else 
              echo "Something went wrong..."
              return -1 
    fi

  }

linux-tkg(){
dir=$pwd
cd ~/Downloads &&
  git clone https://github.com/Frogging-Family/linux-tkg.git &&
  cd linux-tkg &&
  makepkg -si &&
  cd .. &&
  rm -rf linux-tkg  &&
  cd $dir &&
  doas update-grub
}

#need to implement a hook for case where use exits midway. 
#the hook should cd back to pwd if clone is not yet complete,
#or else it should delete the cloned directory from tmp and cd back to pwd

wine-tkg(){
    dir=$pwd
    cd ~/Downloads &&
	git clone https://github.com/Frogging-Family/wine-tkg-git.git &&
	cd wine-tkg-git/wine-tkg-git &&
	makepkg -si &&
	cd ../.. &&
	rm -rf wine-tkg-git
        cd $dir

}
proton-tkg(){
    dir=$pwd
        cd ~/Downloads &&
	    git clone https://github.com/Frogging-Family/wine-tkg-git.git &&
	    cd wine-tkg-git/proton-tkg &&
	    makepkg -si &&
	    cd ../.. &&
	    rm -rf wine-tkg-git
	    cd $dir
    }
wineproton-tkg(){
dir=$pwd
cd ~/Downloads &&
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
linux-tkg && wineproton-tkg
}
