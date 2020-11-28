status() {
  git status
}
add() {
	git add $1 $2 $3 $4 $5 $6 $7 $8 $9
}

commit() {
	git commit $1 $2
}

push() {
git push $1 $2
}

pull(){
git pull $1 $2
}

branch() {
	git branch $1
}

checkout(){
	git checkout $1
}

merge(){
	git merge $1
}

clone() {
	git clone $1
}

sync() {
	rm -rf $1 && clone https://github.com/atugard/$1
}

gimme(){
  git clone https://github.com/atugard/$1
}
