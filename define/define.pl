use strict;
use warnings;
use URI;
use Web::Scraper;
use Encode;
use utf8;
use Term::ANSIColor;

sub get_definitions {
    my $url = shift(@_);
    my $def_info = scraper { 
        process '.css-pnw38j', 'definition_block[]'=> scraper{
            process ".css-1gxch3", 'word_type'=> 'TEXT';
            process ".e1q3nk1v3", "definitions[]"=>'TEXT';
        };
    };
    my $res = $def_info->scrape( URI->new($url));
    my $rdef= $res->{definition_block};
    bless $rdef;
    print_definitions $rdef;
};

sub print_definitions{
    my $rdef = shift(@_);
    my @def = @$rdef;
    for my $def_info (@def){
        my $word_type = %$def_info{word_type};
        my $definitions_ref = %$def_info{definitions};
        my @definitions = @$definitions_ref;
        print color('bold blue');
        print "===============================\n";
        print "$word_type: \n";
        print "===============================\n";
        print color('reset');
        for my $i (0.. ((scalar @definitions)-1)){
            print color('bold green');
            my $j = $i + 1;
            print Encode::encode("utf8" , "$j: $definitions[$i] \n\n");
            print color('reset');
        };
    };
};

sub main{
    my $word = shift(@ARGV);
    my $url = "https://www.dictionary.com/browse/$word?s=t";
    get_definitions $url;
};

main();
