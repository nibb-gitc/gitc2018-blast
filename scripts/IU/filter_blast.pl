#!/usr/bin/perl

$infile = $ARGV[0];
$eval_cutoff = 0.001;	

open(F, $infile) || die "Can't open file\n";	

while ($line = <F>) {
		
    chomp $line;
    @col = split(/\t/, $line);

    if ($col[10] <= $eval_cutoff) {
        print join("\t", $col[0], $col[1], $col[10]),"\n";
    }
}
