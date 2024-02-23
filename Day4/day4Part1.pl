use warnings;
use strict;

my $filename = "cards.txt";
open(FH, '<', $filename);

my $total_points = 0;
my $points; 

my @winningNums;
my @nums;

my $tempString1;
my $tempString2; 

while(<FH>){

    $points = -1;

    #cut larger string into stirngs of just one side of nums
    ($tempString1) = $_ =~ m/:(.*?)\|/;
    ($tempString2) = $_ =~ m/\|(.*?)\n/;

    #store nums into arrays
    @nums = ($tempString1 =~ m/\d+/g);
    @winningNums = ($tempString2 =~ m/\d+/g);

    #count matches
    for(my $i = 0; $i < scalar(@nums); $i++){
        for(my $j = 0; $j < scalar(@winningNums); $j++){
            if ($nums[$i] == $winningNums[$j]){
                $points++; 
            }
        }
    }

    #add to total
    if($points != -1){
        $total_points = $total_points + (2**$points);
    }
}

print "total: $total_points\n";


close(FH);