#!/usr/bin/perl

$RATIO = 0.9;
$evalue_cutoff = 0.001;

open(F, $ARGV[0]) || die "Can't open file\n";
while (<F>) {
	@F = split;
	$name1 = $F[0];
	$name2 = $F[1];
	$evalue = $F[10];
	$score = $F[11];

        next if ($evalue > $evalue_cutoff);

	if (! defined $Best1{$name1}) {
		$Best1{$name1} = $score;
	}
	if (! defined $Best2{$name2}) {
		$Best2{$name2} = $score;
	}
	if ($score >= $Best1{$name1} * $RATIO && $score >= $Best2{$name2} * $RATIO) {
		print;
	}
}
