mirrors(){
  echo "Fetching mirrors..." &&
    curl -s "https://www.archlinux.org/mirrorlist/?country=${2:-CA}&country=${3:-US}&protocol=https&use_mirror_status=on" | 
    sed -e 's/^#Server/Server/' -e '/^#/d' | 
    rankmirrors -n ${1:-5} - > /tmp/mirrors &&
    sudo cp /tmp/mirrors /etc/pacman.d/mirrorlist &&
    rm /tmp/mirrors &&
    echo "Done!"
  }
