use strict;
use warnings;

my $filename = "farming.txt";
open(FH,'<',$filename);

my @seeds;
my @parse;
my $seedStrings;
my $line = 0;
my @shell; 
my @unchanged; 
my $fly; 

while(<FH>){
    #pull the initial seeds into seeds array
    #just want this to happen for the first line
    if($line == 0){
        ($seedStrings) = ($_ =~ m/seeds:\s+(\d+(?:\s+\d+)*)/);
        (@parse) = ($seedStrings =~ m/(\d+)/g);
        for (my $i = 0; $i < scalar(@parse); $i = $i + 2){
            for (my $j = 0; $j < $parse[$i+1]; $j++){
                push(@unchanged, 0);
                push(@seeds, $j + $parse[$i]);
            }
        }
    } else {
        #if new section
        if($_ =~ m/map:/){
            for (my $i = 0; $i < scalar(@seeds); $i++){
                $unchanged[$i] = 0;
            }
        } else {
            #else check to change
            @shell = ($_ =~ m/(\d+)/g);
            if (@shell != 0){
                for(my $i = 0; $i < scalar(@seeds); $i++){
                    if($shell[1] <= $seeds[$i] && $seeds[$i] < $shell[2] + $shell[1] && $unchanged[$i] == 0){
                        #if in the range update
                        $seeds[$i] = $shell[0] + ($seeds[$i]-$shell[1]);
                        $unchanged[$i] = 1;
                    }
                }
            }
        }
    }

    $line++;
}

#find lowest
my $lowest = $seeds[0];
for (my $i = 0 ; $i < scalar(@seeds); $i++){
    if ($seeds[$i] < $lowest){
        $lowest = $seeds[$i];
    }
}
print "lowest: $lowest\n";

close(FH);