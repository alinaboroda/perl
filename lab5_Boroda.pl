
#!/usr/bin/perl -w
use strict;

my ($inputFile, $count, $outputFile) = @ARGV;

die "You don't enter a name of file.\n" unless (defined $inputFile);
die "You don't enter a number of requests for each host.\n" unless (defined $count);

my (@ping, $max_time, $loss, $ip);

open (my $fo, ">>", "$outputFile") if (defined $outputFile);

sub read_hosts {

    my ($inputFile) = @_; 
    open (my $fh, "<", "$inputFile") or die "Can't open the file.\n";
    while (<$fh>) {
        my @hosts;
        chomp;
        next unless ($_);
        push @hosts, $_ for (split ' ', $_);
        return @hosts;
        
    }
}


my @arr = read_hosts($inputFile);
print @arr;



