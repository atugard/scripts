function latex_build {
    perl ~/.scripts/perl-scripts/latex_build/latex_build.pl $1
}

function define {
    perl ~/.scripts/perl-scripts/define/define.pl $1
}

function perl? {
    perl -MO=Deparse -e $1
}

function defn {
    python ~/.scripts/python-scripts/dictionary/dictionary.py $1 $2
}
