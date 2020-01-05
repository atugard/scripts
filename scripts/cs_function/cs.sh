function cs {
    echo "Which chapter are you on?"
    read chapter
    #handle chapter 1
    if [ $chapter = 1 ]; then
        echo "Would you like to \n
        1. (vim) Open notes_and_exercises in vim?  \n
        2. (scheme) Load notes_and_exercises in scheme? \n
        3. (git) Add, commit, and push notes_and_exercises to git repo? \n

        Type vim, scheme, or git, or anything else to quit: "
              
        read answer
        if [ "$answer" = "vim" ]; then
            vim ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
        fi
        if [ "$answer" =  "scheme" ]; then
            scheme --load ~/Dropbox/computer_science/$chapter/notes_and_exercises.scm
        fi
        if [ "$answer" = "git" ]; then
            echo "What is your commit message?"
            read commit_message
            cd ~/Dropbox/computer_science/1
            git add ~/Dropbox/computer_science/1/notes_and_exercises.scm
            git commit -m "$commit_message"
            git push origin master
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


