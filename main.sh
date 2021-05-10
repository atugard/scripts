load(){
  for folder in $HOME/shell-functions/src/*; do
    for file in $folder/*; do
      source $file;
    done
  done
}

load

