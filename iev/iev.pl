use common::sense;
use List::Util qw(sum);
use List::MoreUtils qw(pairwise);

my @expectations = (2, 2, 2, 1.5, 1, 0);
my @input = split /\s+/, scalar <>;

say sum pairwise { $a * $b } @expectations, @input;
