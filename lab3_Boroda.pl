#!/usr/bin/perl -w
use strict;

my $first_port = 0;
if (defined $ARGV[0]) {
	if (int($ARGV[0]) > 0) {
		$first_port = $ARGV[0];	
	} else {
		print "You enter incorrect number of port. Number of port has to be number > 0.\n";
	}
} else {
	print "You don't enter number of port.\n"
}


my $last_port = $first_port;
if (defined $ARGV[1]) {
	if (int($ARGV[1]) > 0 and $ARGV[1] >= $first_port) {
		$last_port = $ARGV[1];	
	} else {
		print "You enter incorrect last number of port.\nNumber of port has to be number > 0.\nLast number of port has to be greater than first number.\n";
	}
}

open (my $fh, "<", "/etc/services") or die "Can't open file!";
my %port_serv;
while (<$fh>) {
	last unless ($first_port and $last_port);
	chomp;
	next unless ($_);
	next if ((index $_, '#') eq  "0");
	my @arr = split ' ', $_;
	$port_serv{(split '/', $arr[1])[0]} = $arr[0];
}

for (my $i = $first_port; $i <= $last_port; $i++) {
	print $i . " - " . $port_serv{$i} . "\n" if ( $port_serv{$i} );
	}


