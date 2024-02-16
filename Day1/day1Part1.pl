#!/usr/bin/perl 
use warnings;
use strict;

my $filename = 'calibration.txt';

#FH is a file handel keyword, < is the r/w premission (read only here)
open(FH, '<', $filename) or die $!;

#the $ at front of all these variables means scalar
my $total = 0; 
my $val = "";
my $val2 = 0;
my $val1 = 0;
my $line = 0;
my $valadd = 0; 

#go thru lines pull totals
while(<FH>){
    #Scrape ints
    ($val) = join('',($_ =~ m/(\d+)/g));
    ($val2) = ($val =~ m/(\d)$/);
    ($val1) = ($_ =~ m/(\d)/g);
    ($valadd) =  join('', $val1, $val2);
    $total = $total + $valadd;
}
print $total; 
close(FH);