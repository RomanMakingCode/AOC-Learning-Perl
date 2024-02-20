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
my $val1 = 0;
my $val2 = 0; 
my $index1 = -1;
my $index2 = -1;

my $total = 0;

while(<FH>){
    #find special character
    while ($_ =~ m/[^.\n\d]/g){
        $indexer = 0;
        $val1 = 0;
        $val2 = 0;
        $index1 = -1; 
        $index2 = -1; 
        
        #print "found special at $lineNum, $-[0], $+[0]\n";
        #check if surronding coordinates match, if does set valid
        for(my $i = 0; $i < scalar(@values); $i++){
            #check above left 
            if(($lineNum - 1 ) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]){
                $val1 = $values[$i];
                $index1 = $i;
            }

            #check above middle 
            if(($lineNum - 1 ) == $line[$i] && ($-[0]) >= $start[$i] && ($-[0]) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }
            
            #check above right 
            if(($lineNum - 1 ) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }

            #check left
            if(($lineNum) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }
            
            #check right
            if(($lineNum) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }

            #check below left 
            if(($lineNum + 1 ) == $line[$i] && ($-[0]-1) >= $start[$i] && ($-[0]-1) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }
                
            #check below middle
            if(($lineNum + 1 ) == $line[$i] && ($-[0]) >= $start[$i] && ($-[0]) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }

            #check below right
            if(($lineNum + 1 ) == $line[$i] && ($-[0]+1) >= $start[$i] && ($-[0]+1) < $end[$i]){
                #ensure new number
                if ($index1 != $i && $index2 != $i){
                    #if no other value found so far
                    if($index1 == -1){
                        $val1 = $values[$i];
                        $index1 = $i;
                    } else {
                        #if another has been put in second position
                        $val2 = $values[$i];
                        $index2 = $i; 
                    }
                }
            }
        }
        $total = $total + $val1 * $val2; 
    }
    $lineNum = $lineNum + 1; 
}
close(FH);

print "Total: $total\n";

#78915902