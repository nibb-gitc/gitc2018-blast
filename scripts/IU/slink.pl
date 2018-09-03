#!/usr/bin/perl

open(F, $ARGV[0]) || die "Can't open file\n";
while (<F>) {
	($name1, $name2) = split;

	$Link{$name1}{$name2} = $Link{$name2}{$name1} = 1;
}

foreach $node (keys %Link) {
	if ($Mark{$node} == 0) {
		local(@Cluster);
		$clustID++;
		&traverse($node);
		$size = @Cluster;
		print "Cluster $clustID [$size]\n";
		foreach $node (sort @Cluster) {
			print "$node\n";
		}
		print "\n";
	}
}

sub traverse {
	my($node1) = @_;
	return if ($Mark{$node1} > 0);
	push(@Cluster, $node1);
	$Mark{$node1} = 1;
	foreach $node2 (keys %{$Link{$node1}}) {
		&traverse($node2);
	}
}
