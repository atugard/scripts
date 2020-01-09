use strict;
use warnings; 
use URI;
use utf8;
use Term::ANSIColor;

sub execute{
    my $ch_num = shift(@_);
    my $file_name = shift(@_);
    my $operation = shift(@_);
    #get rid of trailing new lines.
    chomp $file_name;
    chomp $operation;
    system "$operation ~/Dropbox/computer_science/$ch_num/$file_name";
}

sub print_options{
    my $ch_num = shift(@_);
    my @procs = ("vim", "scheme", "git");
    my $file = shift(@_);
    print "Would you like to \n";
    print color('bold blue');
    print "vim ";
    print color('reset');
    print "Open ";
    print color('bold green');
    print $file;
    print color('reset');
    print " in vim?  \n";
    print color('bold blue');
    print "scheme " ;
    print color('reset');
    print "Load ";
    print color('bold green');
    print $file; 
    print color('reset');
    print " in scheme? \n";
    print color('bold blue');
    print "git ";
    print color('reset');
    print "Add, commit, and push ";
    print color('bold green');
    print $file;
    print color('reset');
    print " to git repo? \n";
    print "Type vim, scheme, or git, or q to quit. ";
    my $operation = <STDIN>;
    chomp $operation;
    if("$operation" eq "q"){
        print "Exiting...\n";
    }else{
        my @args = ($file, $operation);
        execute($ch_num, $file, $operation);
    }
}

sub indexer{
    my $ch_num = shift(@_);
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
        print_options($ch_num, $_[$input]);
    }
}

sub main{
    print "Which  chapter are you on? Enter number, or q to quit. \n";
    my $input = <STDIN>;
    chomp $input;
    if("$input" eq "q"){
        print "Exiting... \n";
    }else{
        my @file_array = `cd ~/Dropbox/computer_science/"$input" && ls | grep .scm`;
        indexer($input, @file_array);
    }
}
main();
