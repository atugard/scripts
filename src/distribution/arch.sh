mirrors(){
  echo "Fetching mirrors..." &&
    curl -s "https://www.archlinux.org/mirrorlist/?country=${2:-CA}&country=${3:-US}&protocol=https&use_mirror_status=on" | 
    sed -e 's/^#Server/Server/' -e '/^#/d' | 
    rankmirrors -n ${1:-5} - > ~/mirrors &&
    sudo cp ~/mirrors /etc/pacman.d/mirrorlist &&
    rm ~/mirrors &&
    echo "Done!"
  }
