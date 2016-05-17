#!/usr/bin/perl -w

use strict;

open (my $fh, "<", "/etc/services") or die "Can't open file!";

my %serv_port;
while (<$fh>) {

	chomp;
	next unless ( $_ );
	next if ( (index $_, '#') eq  "0" );
	my @arr = split ' ', $_;
	$serv_port{$arr[0]} = (split '/', $arr[1])[0];
	#print "$arr[0] $arr[1]  \n";
	#print $_ . "\n";
	
}

print $_ . '  ' . $serv_port{$_} . "\n" for ( keys (%serv_port) );

