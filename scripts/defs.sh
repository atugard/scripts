function latex_build {
    perl ~/.scripts/latex_build/latex_build.pl $1
}

function define {
    perl ~/.scripts/define/define.pl $1
}

function perl? {
    perl -MO=Deparse -e $1
}

