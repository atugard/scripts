function cs {
    echo "Which chapter are you on?"
    read chapter
    #handle chapter 1
    if [ $chapter = 1 ]; then
        echo "Would you like to open notes_and_exercises in vim or load it in scheme? (vim/scheme): \n"
        read answer
        if [ "$answer" = "vim" ]; then
            vim ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
        fi
        if [ "$answer" =  "scheme" ]; then
            scheme --load ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
        fi
    fi
    #handle chapter 2
    if [ $chapter = 2 ]; then
        vim ~/Dropbox/computer_science/$chapter/notes_and_exercises.c
    fi
    #handle chapter 3
    if [ $chapter = 3 ]; then
        vim ~/Dropbox/computer_science/$chapter/notes_and_exercises.c
    fi
}


