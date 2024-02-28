use strict;
use warnings;

#i'm just going to write in the numbers lol this one seems free 
#my @time = (49, 78, 79, 80);
#my @distance = (298, 1185, 1066, 1181);

my @time = (49787980);
my @distance = (298118510661181); 

my @numberWins = (0,0,0,0);

for (my $i = 0; $i < scalar(@time); $i++){
    for(my $j = 0; $j < $time[$i]; $j++){
        if($j * ($time[$i] - $j) > $distance[$i]){
            $numberWins[$i]++;
        }
    }
}

my $total = $numberWins[0];
print "total: $total\n"; 