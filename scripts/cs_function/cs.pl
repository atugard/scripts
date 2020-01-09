use strict;
use warnings; 
use URI;
use utf8;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

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
        print "\nWould you like to: \n\n";
        print color('bold magenta');
        print "===========================================\n\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "vim";               #open file in vim
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
        print "scheme" ;          #load file in scheme
        print color('reset');
        print ") ";
        print "Load ";
        print color('bold blue');
        print $_file; 
        print color('bold magenta');
        # print "-------------------------------------------\n";
        print  color('reset');
        print "  (";
        print color('bold green');
        print "git";             #add,commit, and push file to repo.
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
    exec_procedure($file, $procedure);
}
sub select_scm_file{
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
    }else{
        options $_[$input];
    }
}
sub main{
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
        print "Which  chapter are you on? Enter number, or q to quit. \n\n";
    }
    print_chapters;
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
