use strict;
use warnings; 
use URI;
use utf8;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);


#todo: add loop at this level.
sub exec_procedure{
    my $ch_number = shift(@_);
    my $file = shift(@_);
    my $procedure = shift(@_);
    if ("$procedure" eq "q"){
        print "Exiting... \n";
    }elsif ("$procedure" eq "1"){
        system "vim ~/Dropbox/computer_science/$ch_number/$file";
    }elsif ("$procedure" eq "2"){
        system "scheme --load ~/Dropbox/computer_science/$ch_number/$file";
    }elsif ("$procedure" eq "3"){
        sub git{
            my $ch_number = shift(@_);
            my $operation = shift(@_);
            system "git -C ~/Dropbox/computer_science/$ch_number $operation"
        };
        git($ch_number, "add $file");
        print "What is your commit message?\n";
        my $commit_message = <STDIN>;
        git($ch_number, "commit -m $commit_message");
        git($ch_number, "push origin master");
    }else{
        print "\nCouldn't find $procedure to run on file $file. \n";
    }
}

sub options{
    my $ch_number = shift(@_);
    my $file = shift(@_);
    print $file;
    sub print_options_for_file{
        my $_file = shift(@_);
        print "\n\n Would you like to: \n\n";
        print color('bold magenta');
        print "===========================================\n\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "1";               #open file in vim
        print color('reset');
        print ") ";
        print "   Edit ";
        print color('bold blue');
        print $_file;
        print color('bold magenta');
        # print "-------------------------------------------\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "2" ;          #load file in scheme
        print color('reset');
        print ") ";
        print "   Load ";
        print color('bold blue');
        print $_file; 
        print color('bold magenta');
        # print "-------------------------------------------\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "3";             #add,commit, and push file to repo.
        print color('reset');
        print ") ";
        print "   Push ";
        print color('bold blue');
        print $_file;
        print color('bold magenta');
        print "\n===========================================\n\n";
        print  color('reset');

        print "Type vim, scheme, or git, or q to quit.\n\n";
    }
    print_options_for_file $file;

    my $procedure = <STDIN>;
    chomp $procedure;
    exec_procedure($ch_number, $file, $procedure);
}
sub select_scm_file{
    my $ch_number = shift @_;
    my $n = scalar @_;
    print "Would you like to: \n\n";
    print color('bold magenta');
    print "===========================================\n\n";
    print  color('reset');
    for my $i (0.. ($n-1)){
        print "  (";
        print color('bold green');
        print $i+1;
        print color('reset');
        print ") ";
        print " Access ";        
        print color('bold blue');
        print "$_[$i]";
        print color('reset');
    };
    print color('bold magenta');
    print "\n===========================================\n\n";
    print  color('reset');
    print "  Enter number, or q to quit.\n\n";
    my $input = <STDIN>;
    chomp $input;
    if("$input" eq "q"){
        print "Exiting... \n";
    #add looks like  number code here
    }elsif($input>$n){
        my $upperbound = $n-1;
        print "\nSorry. You must select a number between 0 and $upperbound \n";
        select_scm_file($ch_number , @_);
    }
    else{
        options($ch_number, $_[$input-1]);
    }
}
sub main{
    print "Which  chapter are you on? Enter number, l to list options, or q to quit. \n\n";
    my $input = <STDIN>;
    chomp $input;

    #
    sub print_chapters{
        print color('bold magenta');
        print "===========================================\n\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "1";
        print color('reset');
        print ") ";
        print " Programming\n";
        print "  (";
        print color('bold green');
        print "2";
        print color('reset');
        print ") ";
        print " Computer Architecture.\n";
        print "  (";
        print color('bold green');
        print "3";
        print color('reset');
        print ") ";
        print " Algorithms and Data Structures.\n";
        print "  (";
        print color('bold green');
        print "4";
        print color('reset');
        print ") ";
        print " Math for CS.\n";
        print "  (";
        print color('bold green');
        print "5";
        print color('reset');
        print ") ";
        print " Operating systems.\n";
        print "  (";
        print color('bold green');
        print "6";
        print color('reset');
        print ") ";
        print " Computer Networking\n";
        print "  (";
        print color('bold green');
        print "7";
        print color('reset');
        print ") ";
        print " Databases\n";
        print "  (";
        print color('bold green');
        print "8";
        print color('reset');
        print ") ";
        print " Languages and Compilers\n";
        print "  (";
        print color('bold green');
        print "9";
        print color('reset');
        print ") ";
        print " Distributed Systems.\n";
        print color('bold magenta');
        print "\n\n===========================================\n\n";
        print  color('reset');
    }

    #handle input
    if( "$input" eq "q" ){
        print "Exiting... \n";
    }elsif(looks_like_number($input)){
        #handle by chapter. develop general chapter functions??
        if( $input==1 || $input==2 ){
            my @file_array = `cd ~/Dropbox/computer_science/"$input" && ls | grep .scm`;
            select_scm_file($input, @file_array);
        }else{
            system "perl ~/tools/scripts/cs_function/cs.pl";
        }
    }elsif("$input" eq "l"){
        print_chapters;
        system "perl ~/tools/scripts/cs_function/cs.pl";

    }else{
        system "perl ~/tools/scripts/cs_function/cs.pl";
    }
}

main();
