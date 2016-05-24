#!/usr/bin/perl -w
use strict;

my $path = "words";
open (my $fh, "<", "$path") or die "Can't open a file $path.\n";

my $count;
my $length = 15;
while (<$fh>) {
    chomp;
    $count++ if (length $_ >= $length );   
}
print "Count of words with length equal or more than $length in $path is $count. \n";

