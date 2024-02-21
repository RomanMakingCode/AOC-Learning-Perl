use warnings;
use strict;

my $filename = "smallcards.txt";
open(FH, '<', $filename);

my $total_points;
my $points; 

my @winningNums;
my @nums;
my $string; 
my @numbers;

while(<FH>){
    @nums = ($_ =~ m/:(\d+)/g);
    print "nums: @nums\n";
}

close(FH);