function cs {
    echo "Which chapter are you on?"
    read chapter
    echo "Would you like to open notes_and_exercises.scm in vim or load it in scheme? (vim/scheme):\n"
    read answer
    if [ "$answer" = "vim" ]; then
        vim ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
    fi
    if [ "$answer" =  "scheme" ]; then
        scheme --load ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
    fi
}


