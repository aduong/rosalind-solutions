use common::sense;
use Permutor qw(permutation_iterator factorial);

my $n = <>;
my $sppp = 2 ** $n; # "signed perms per permutation"

say factorial($n) * $sppp;

my $perm_it = permutation_iterator([ 1..$n ]);

while (my @perm = $perm_it->()) {
    for my $i (0..($sppp-1)) {
        my $select = 1;
        say join ' ', map {
            my $v = $i & $select ? -$_ : $_;
            $select <<= 1;
            $v;
        } @perm;
    }
}
