#!/bin/usr/perl
use warnings;
use strict;

#open file
my $filename = "engineMap.txt";
open(FH, '<', $filename);


#number holder objects: value, to add, coordinate array, 
my @values;
my @valid;

my @start;
my @end;
my @line;

my $lineNum = 0; 
while(<FH>){
    #find value and add to array
    while ($_ =~ m/(\d+)/g){
        #add found value
        push(@values, $1);
        #add index of start
        push(@start, $-[0]);
        #add index of end
        push(@end, $+[0]);
        #add current line number
        push(@line, $lineNum);
        #set as invalid
        push(@valid, 0);
    }
    #increment line!
    $lineNum = $lineNum + 1; 
}
close(FH);

open(FH, '<', $filename);
$lineNum = 0;
my $indexer = 0; 
while(<FH>){
    #find special character
    while ($_ =~ m/[^.\n\d]/g){
        $indexer = 0;
        
        #print "found special at $lineNum, $-[0], $+[0]\n";
        #check if surronding coordinates match, if does set valid
        for(my $i = 0; $i < scalar(@values); $i++){
            if(        
                #check above left 
                (($lineNum - 1 ) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]) ||
                #check above middle 
                (($lineNum - 1 ) == $line[$i] && ($-[0]) >= $start[$i] && ($-[0]) < $end[$i]) ||
                #check above right 
                (($lineNum - 1 ) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i]) ||

                #check left
                (($lineNum) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]) ||
                #check right
                (($lineNum) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i]) ||

                #check below left 
                (($lineNum + 1 ) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]) ||
                #check below middle
                (($lineNum + 1 ) == $line[$i] && ($-[0]) >= $start[$i] && ($-[0]) < $end[$i]) ||
                #check below right
                (($lineNum + 1 ) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i])
                ){

                $valid[$i] = 1;
            }
        }
    }
    $lineNum = $lineNum + 1; 
}
close(FH);

#add up the values ticked as valid
my $total = 0; 
for(my $i = 0; $i < scalar(@values); $i++){
    if ($valid[$i] == 1){
        $total = $total + $values[$i];
    }
}
print "Total: $total\n";