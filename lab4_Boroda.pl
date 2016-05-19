#!/usr/bin/perl -w
use strict;

my $fileName;
my $count;
if (defined $ARGV[0]) {
    $fileName = $ARGV[0];
    if (defined $ARGV[1]) {
        $count = $ARGV[1];
        open (my $fh, "<", "$fileName") or die "Can't open the file.\n";
        while (<$fh>) {
            chomp;
            next unless ($_);
            system "ping -c $count $_";
            

        }
    } else {
        print "You don't enter count.\n";
    }




} else {
    print "You don't enter fileName.\n";
}
#neskolko v stochke