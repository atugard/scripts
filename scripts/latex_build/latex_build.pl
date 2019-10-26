use strict;
use 5.30.0;
use warnings;
use Cwd qw(cwd);


sub texdvi{
    my ($file, $dir) =@_;
    system("latex", "$dir/$file");
    $file =~ s{\.[^.]*(?:\.tex)?$}{.dvi};
    dvips($file, $dir);
}
sub dvips{
    my ($file, $dir) = @_;
    system("dvips", "$dir/$file");
    system("rm", "$dir/$file");
    $file =~ s{\.[^.]*(?:\.dvi)?$}{.ps};
    pspdf($file, $dir);

}
sub pspdf{
    my ($file, $dir) = @_;
    system("ps2pdf", "$dir/$file");
    system("rm", "$dir/$file");

}
sub main {
    my $dir = cwd;
    my $file = shift(@ARGV);
    my ($ext) = $file =~ /(\.[^.]+)$/;
    if("$ext" eq ".tex"){
        texdvi($file, $dir);
        my @arr = ("aux", "log", "out");
        foreach (@arr){
            $file =~ s{\.[^.]*(?:\.tex)?$}{.$_};
            system("rm", "$dir/$file");
        }
    }
    else{
        print('File must have .tex extension!')
    }
}

main();
