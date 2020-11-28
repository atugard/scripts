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
