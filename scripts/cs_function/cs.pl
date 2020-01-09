use strict;
use warnings; 
use URI;
use utf8;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
#git operation cd ~/Dropbox/computer_science/1/ && git add
#notes_and_exercises.scm -m $1
#;we can syntactically form the entire proposition before we even pass it as an
#argument to execute! We can do analysis on syntax first...


#Space here to do analysis on syntax...



sub exec_procedure{
    my $file = shift(@_);
    my $procedure = shift(@_);
    if ("$procedure" eq "vim"){
        system "vim ~/Dropbox/computer_science/1/$file";
    }elsif ("$procedure" eq "scheme"){
        system "scheme --load ~/Dropbox/computer_science/1/$file";
    }elsif ("$procedure" eq "git"){
        sub git{
            my $operation = shift(@_);
            system "git -C ~/Dropbox/computer_science/1 $operation"
        };
        git "add $file";
        print "What is your commit message?\n";
        my $commit_message = <STDIN>;
        git "commit -m $commit_message";
        git "push origin master";
    }else{
        print "Couldn't find $file $procedure !";
    }
}

sub options{
    my $file = shift(@_);
    print $file;
    sub print_options_for_file{
        my $_file = shift(@_);
        print "Would you like to \n";
        print color('bold blue');
        print "vim ";               #open file in vim
        print color('reset');
        print "Open ";
        print color('bold green');
        print $_file;
        print color('reset');
        print " in vim?  \n";
        print color('bold blue');
        print "scheme " ;          #load file in scheme
        print color('reset');
        print "Load ";
        print color('bold green');
        print $_file; 
        print color('reset');
        print " in scheme? \n";
        print color('bold blue');
        print "git ";             #add,commit, and push file to repo.
        print color('reset');
        print "Add, commit, and push ";
        print color('bold green');
        print $_file;
        print color('reset');
        print " to git repo? \n";
        print "Type vim, scheme, or git, or q to quit. ";
    }
    print_options_for_file $file;

    my $procedure = <STDIN>;
    chomp $procedure;
    exec_procedure($file, $procedure);
}
sub select_scm_file{
    my $n = scalar @_;
    print "Would you like to: \n";
    for my $i (0.. ($n-1)){
        print color('bold green');
        print "  $i";
        print color('reset');
        print " Access $_[$i]  \n";
    };
    print "  Enter a number, or q to quit.";
    my $input = <STDIN>;
    chomp $input;
    if("$input" eq "q"){
        print "Exiting... \n";
    }else{
        options $_[$input];
    }
}
sub main{
    print "Which  chapter are you on? Enter number, or q to quit. \n";
    my $input = <STDIN>;
    chomp $input;
    if( "$input" eq "q" ){
        print "Exiting... \n";
    }elsif(looks_like_number($input)){
        if($input==1){
            my @file_array = `cd ~/Dropbox/computer_science/"$input" && ls | grep .scm`;
            select_scm_file(@file_array);
        }else{
            system "perl ~/tools/scripts/cs_function/cs.pl";
        }
    }else{
        system "perl ~/tools/scripts/cs_function/cs.pl";
    }
}

main();
