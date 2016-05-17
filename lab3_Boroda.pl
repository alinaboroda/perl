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

if ( $ARGV[0] and $ARGV[1]) {
	print "YES";

} elsif ( $ARGV[0] ) {
	print $ARGV[0] . " - " . $port_serv{$ARGV[0]} . "\n";

} else {
		print "You don't enter number of port \n";

}

