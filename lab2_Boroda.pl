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

my @sortKeys = (sort {$chars{$b} <=> $chars{$a}} keys %chars);

print "The most number is $chars{$sortKeys[0]}:\n";
for my $char (@sortKeys) {
    if ($chars{$sortKeys[0]} == $chars{$char}) {
        print $char  . "\n";
    } else {
        last;
    }
}

if ($chars{$sortKeys[-1]} != $chars{$sortKeys[0]}) {
    print "The less number is $chars{$sortKeys[-1]}:\n";
    for my $char (reverse @sortKeys) {
        if ($chars{$sortKeys[-1]} == $chars{$char}) {
            print $char . "\n";
        } else {
            last;
        }
    }
}

