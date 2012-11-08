use common::sense;
use Permutor qw(factorial permutation_iterator);

my $n = <>;

say factorial($n);

my $it = permutation_iterator([1..$n]);
while (my @perm = $it->()) {
    say join ' ', @perm;
}
