use strict;
use warnings;

#i'm just going to write in the numbers lol this one seems free 
my @time = (49, 78, 79, 80);
my @distance = (298, 1185, 1066, 1181);

#my @time = (7, 15, 30);
#my @distance = (9, 40, 200); 

my @numberWins = (0,0,0,0);

for (my $i = 0; $i < scalar(@time); $i++){
    for(my $j = 0; $j < $time[$i]; $j++){
        if($j * ($time[$i] - $j) > $distance[$i]){
            $numberWins[$i]++;
        }
    }
}

my $total = $numberWins[0] * $numberWins[1] * $numberWins[2] * $numberWins[3];
print "total: $total\n"; 