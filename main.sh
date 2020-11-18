load(){
    for folder in ~/Scripts/shell-functions/src/*; do
	for file in $folder/*; do
	    source $file;
	done
    done
}

load

