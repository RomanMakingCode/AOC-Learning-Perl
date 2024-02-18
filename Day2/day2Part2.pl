#!usr/bin/perl

use warnings;
use strict;

#final sum stored here
my $total = 0; 

#variables to help pull
my $blue_high = 0;
my @blueVals;

my $red_high = 0;
my @redVals;

my $green_high = 0;
my @greenVals; 

#open file
my $filename = "gameInfo.txt";
open(FH, '<', $filename);

#temp variables
my $workingString = "";
my $workingNum = 0; 

while(<FH>){
    #set up
    $workingString = $_;
    $workingString = reverse($workingString);
    $blue_high = 0;
    $red_high = 0;
    $green_high = 0;

    #find max blue
    @blueVals =($workingString =~ m/eulb\s+(\d+)/g);
    for(@blueVals){
        $workingNum = reverse($_);
        if ($blue_high < $workingNum){
            $blue_high = $workingNum;
        }
    }

    #find max red
    @redVals =($workingString =~ m/der\s+(\d+)/g);
    for(@redVals){
        $workingNum = reverse($_);
        if ($red_high < $workingNum){
            $red_high = $workingNum;
        }
    }

    #find max green
    @greenVals =($workingString =~ m/neerg\s+(\d+)/g);
    for(@greenVals){
        $workingNum = reverse($_);
        if ($green_high < $workingNum){
            $green_high = $workingNum;
        }
    }
    
    $total = $total + $green_high * $red_high * $blue_high;
}

print "total: $total\n";