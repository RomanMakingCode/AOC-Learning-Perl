#!/bin/usr/perl

use strict;
use warnings;

my $filename = "cards.txt";
open(FH, '<', $filename);

my $total_cards = 0; 

my $tempString1;
my $tempString2; 
my @numbers;
my @winningNums;
my @nums;
my @cardNums;


#create list of matches
while(<FH>){

    @nums = ();
    ($tempString1) = $_ =~ m/:(.*?)\|/;
    @numbers = ($tempString1 =~ m/\d+/g);
    ($tempString2) = $_ =~ m/\|(.*?)\n/;
    @winningNums = ($tempString2 =~ m/\d+/g);


    for (my $i = 0; $i < scalar(@numbers); $i++){
        for (my $j = 0; $j < scalar(@winningNums); $j++){
            if($numbers[$i] == $winningNums[$j]){
                push(@nums, $numbers[$i]);
            }
        }
    }

    #for each line push the list of matching numbers onto array
    push(@cardNums, [@nums]);
}

#initalize the number of cards array
my $lines = 219;
my @numberCards; 
for (my $i = 0; $i < $lines; $i++){
    $numberCards[$i] = 1; 
}

#go throguh and increment the following card number as per the rules
for (my $i = 0; $i < $lines-1; $i++){
    for (my $j = 1; $j < scalar(@{$cardNums[$i]})+1; $j++){
        $numberCards[$i+$j] = $numberCards[$i+$j] + $numberCards[$i];
    }
}

#count total 
for (my $i = 0; $i < $lines; $i++){
    $total_cards = $total_cards + $numberCards[$i]; 
}
print "Total Cards: $total_cards\n";
