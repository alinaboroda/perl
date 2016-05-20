#!/usr/bin/perl -w
use strict;

my ($inputFile, $count, $outputFile) = @ARGV;

die "You don't enter a name of file.\n" unless (defined $inputFile);
die "You don't enter a number of requests for each host.\n" unless (defined $count);

my @ping;
my $max_time;
my $loss;
my $ip;

open (my $fh, "<", "$inputFile") or die "Can't open the file.\n";
open (my $fo, ">>", "$outputFile") if (defined $outputFile);

while (<$fh>) {
    chomp;
    next unless ($_);
    for my $host (split ' ', $_) {
        @ping = (`ping -c $count $host`)[0, -2, -1];
        $ip = join (' ', (split ' ', $ping[0])[1, 2]);
        $loss = (split ' ', $ping[1])[5];
        $max_time = (split '/', (split ' ', $ping[2])[3])[2];
        print "$ip: max_time = $max_time; $loss of loss;\n";
        print $fo `date` . "$ip: max_time = $max_time; $loss of loss;\n" if (defined $outputFile);

      
    }
}
