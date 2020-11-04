load(){
    for folder in ~/shell-functions/src/*; do
	for file in $folder/*; do
	    source $file;
	done
    done
}

load

