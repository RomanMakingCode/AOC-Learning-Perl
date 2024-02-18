#!/usr/bin/perl
use warnings; 
use strict;

my $filename = "gameInfo.txt";
open(FH, '<', $filename) or die $!;

my $red_cubes = 12;
my $green_cubes = 13;
my $blue_cubes = 14;

my $id_total = 0;
my $id = 0;

my @greengames;
my @redgames;
my @bluegames; 

my $workingString = "";
my $workingNum = 0;
my $bust;

while(<FH>){
    $bust = 1; 
    #get game ID
    ($id) = ($_ =~ m/Game\s+(\d+)/);

    #reverse the screen and search for backwards word
    $workingString = reverse($_);

    #create an array of the nums that follow
    @greengames = ($workingString =~ m/neerg\s+(\d+)/g);
    for (@greengames){
        #check if valid
        $workingNum = reverse($_);
        if($workingNum > $green_cubes){
            $bust = 0;
        }
    }

    #repeat for red
    @redgames = ($workingString =~ m/der\s+(\d+)/g);
    for (@redgames){
        $workingNum = reverse($_);
        if($workingNum > $red_cubes){
            $bust = 0;
        }
    }

    #repeat for blue
    @bluegames = ($workingString =~ m/eulb\s+(\d+)/g);
    for (@bluegames){
        $workingNum = reverse($_);
        if($workingNum > $blue_cubes){
            $bust = 0;
        }
    }

    #if !bust, add
    if ($bust == 1){
        $id_total = $id_total + $id;
        #print("Games $id is valid!, new total: $id_total\n");
    }

}

print "id_total = $id_total\n";
