#!/usr/bin/perl -w

use strict;

open (my $fh, "<", "/etc/services") or die "Can't open file!";

my %port_serv;
while (<$fh>) {
	chomp;
	next unless ( $_ );
	next if ( (index $_, '#') eq  "0" );
	my @arr = split ' ', $_;
	$port_serv{(split '/', $arr[1])[0]} = $arr[0];
	
}

#print $_ . '  ' . $port_serv{$_} . "\n" for ( keys (%port_serv) );

if ( int($ARGV[0]) > 0 and int($ARGV[1]) > 0 ) {
	for (my $i = $ARGV[0]; $i <= $ARGV[1]; $i++) {
		print $i . " - " . $port_serv{$i} . "\n" if ( $port_serv{$i} );
}

} elsif ( int($ARGV[0]) > 0 ) {
	print $ARGV[0] . " - " . $port_serv{$ARGV[0]} . "\n";

} else {
		print "You don't enter number of port or You enter not positive number \n";

}

