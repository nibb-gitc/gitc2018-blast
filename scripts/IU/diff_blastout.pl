#!/usr/bin/perl -s

$file1 = $ARGV[0];
$file2 = $ARGV[1];

@fname = split(/\./, $file1);
$fname = "$fname[0]_$fname[2]";

open(F, $file1) || die;
while (<F>) {
	($n1, $n2) = split;
	$Found{$n1}->{$n2} = 1;
}
close(F);

open(F, $file2) || die;
while (<F>) {
	($n1, $n2) = split;
	if ($Found{$n1}->{$n2}) {
		$match++;
		$Found{$n1}->{$n2} = 0;
	} else {
		$only2++;
	}
}
close(F);

foreach $n1 (keys %Found) {
	foreach $n2 (keys %{$Found{$n1}}) {
		if ($Found{$n1}->{$n2}) {
			$only1++;
		}
	}
}
if ($venn) {
	$range1 = "1:" . ($only1+$match);
	$range2 = $only1+1 . ":" . ($only1+$match+$only2);
	system(qq{R --vanilla <<EOF
library(VennDiagram)
in.list <- list(Blast=$range1, Diamond=$range2)
venn.diagram(x=in.list, filename='$fname.tiff',
	cat.cex=1.6,cex=1.5,
	fill = c("cornflowerblue", "darkorchid1"))
EOF});
} else {
	print "match=$match, only_in_1=$only1, only_in_2=$only2\n";
}
