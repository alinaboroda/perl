#!/usr/bin/perl -w

use strict;

my %chars;
while (<>) {
    chomp;
    $chars{'\n'}++;
    for my $char (split('', $_)) {
        $chars{$char}++;   
    }
}

my @keysSort = (sort {$chars{$b} <=> $chars{$a}} keys %chars);

for my $item (@keysSort) {
    if ($chars{$keysSort[0]} == $chars{$item}) {
        print "The most: " . $item . ' - ' . $chars{$item} . "\n";
    } else {
        last;
    }
}

if ($chars{$keysSort[-1]} != $chars{$keysSort[0]}) {
    for my $item (reverse @keysSort) {
        if ($chars{$keysSort[-1]} == $chars{$item}) {
            print "The less: " . $item . ' - ' . $chars{$item} . "\n";
        } else {
            last;
        }
    }
}

