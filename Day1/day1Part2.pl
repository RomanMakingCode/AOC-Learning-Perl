#!/usr/bin/perl

use warnings;
use strict; 

my $filename = "calibration.txt";

# '<' = read only
open(FH, '<', $filename) or die $!;

#declare variables
my $workingString = "";
my $bignum = 0;
my $val1 = 0;
my $val2 = 0;
my $valadd = 0; 
my $total = 0;

#hash map for mapping, % denotes hash map structure in perl
my %replace = (
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    one => "1",
    two => "2",
    three => "3",
    four => "4",
    five => "5",
    six => "6",
    seven => "7",
    eight => "8",
    nine => "9",
    eno => "1",
    owt => "2",
    eerht => "3",
    ruof => "4",
    evif => "5",
    xis => "6",
    neves => "7",
    thgie => "8",
    enin => "9",
);

#iterate through lines
while(<FH>){
    $workingString = $_;

    #Replace any words of numbers with numbers
    $workingString =~ s/(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine)/$replace{$1}/;
    $workingString = reverse($workingString);
    $workingString =~ s/(1|2|3|4|5|6|7|8|9|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/$replace{$1}/;
    $workingString = reverse($workingString);

    #Pull all ints (why do we need paranthesis?)
    ($bignum) = join('', ($workingString =~ m/(\d+)/g));

    #store first and last
    ($val1) = ($bignum =~ m/^(\d)/); #m = match, ^ = start from beginning, \d = digits
    ($val2) = ($bignum =~ m/(\d)$/); #m = match, \d = digits, $ = start from end

    #join and add
    ($valadd) =  join('', $val1, $val2);
    $total = $total + $valadd;
}
print $total; 
close(FH);

#could make this code better by just finding the match and hashing into a new variable...