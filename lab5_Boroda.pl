
#!/usr/bin/perl -w
use strict;

my ($inputFile, $count, $outputFile) = @ARGV;

die "You don't enter a name of file.\n" unless (defined $inputFile);
die "You don't enter a number of requests for each host.\n" unless (defined $count);

sub read_hosts {
    my ($inputFile) = @_; 
    open (my $fh, "<", "$inputFile") or die "Can't open the file.\n";
    my @hosts;
    while (<$fh>) {
        chomp;
        next unless ($_);
        push @hosts, $_ for (split ' ', $_);       
    }
    return \@hosts;
}

sub check {
	my ($host, $count) = @_;
	my (@ping, $max_time, $loss, $ip, $domain);
	@ping = (`ping -c $count $host`)[0, -2, -1];
	
    ($domain, $ip) = (split ' ', $ping[0])[1, 2];
    $loss = (split ' ', $ping[1])[5];
    $max_time = (split '/', (split ' ', $ping[2])[3])[2];
    return $domain, $ip, $max_time, $loss;
}


sub print_res {
	my ($domain, $ip, $max_time, $loss, $outputFile) = @_;
    print `date`;
    print "$domain $ip: max_time = $max_time; $loss of loss;\n\n";
	if (defined $outputFile) {
	    open (my $fo, ">>", "$outputFile");
	    print $fo `date` . "$ip: max_time = $max_time; $loss of loss;\n\n";
	}
}



my $link = read_hosts($inputFile);
for my $host (@{$link}) {
	print print_res(&check($host, $count));
}

