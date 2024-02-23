use strict;
use warnings;

my $filename = "farmMap.txt";
open(FH,'<',$filename);

#pull the initial seeds into seeds array
my @seeds;
my $seedStrings;
my $line = 0;
my @shell; 
my @unchanged; 
my $fly; 

while(<FH>){
    #just want this to happen for the first line
    if($line == 0){
        ($seedStrings) = ($_ =~ m/seeds:\s+(\d+(?:\s+\d+)*)/);
        (@seeds) = ($seedStrings =~ m/(\d+)/g);
        for (my $i = 0; $i < scalar(@seeds); $i++){
            push(@unchanged, 0);
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