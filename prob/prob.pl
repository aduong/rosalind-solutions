use common::sense;
use List::Util qw(sum);

my @seq = split //, scalar <>;
pop @seq;

for my $gc (split /\s+/, scalar <>) {
    my $logGC = log($gc/2)/log(10);
    my $logAT = log((1-$gc)/2)/log(10);

    my $logprob = sum map { /^[AT]$/ ? $logAT : $logGC } @seq;
    print $logprob, ' ';
}

print "\n";
