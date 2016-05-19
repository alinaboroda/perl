#!/usr/bin/perl -w

use strict;

my %chars;
while (<>) {
    chomp;
    $chars{'\n'}++;
    for my $item (split('', $_)) {
    	$chars{$item}++;   
    }
}

my @keysSort = (sort {$chars{$b} <=> $chars{$a}} keys %chars);

for my $item (@keysSort) {
    if ($chars{$keysSort[0]} == $chars{$item}) {
		print $item . ' - ' . $chars{$item} . "\n";
	} else {
		last;
	}
}

if ($chars{$keysSort[-1]} != $chars{$keysSort[0]}) {
	for my $item (reverse @keysSort) {
		if ($chars{$keysSort[-1]} == $chars{$item}) {
			print $item . ' - ' . $chars{$item} . "\n";
		} else {
			last;
		}
	}
}

