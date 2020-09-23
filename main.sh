function load(){
    for folder in ~/shell_functions/src/*; do
	for file in $folder/*; do
	    source $file;
	done
    done
}

load

