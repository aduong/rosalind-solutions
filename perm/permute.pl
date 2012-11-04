use common::sense;
# use Algorithm::Permute; # ;) but against the point

my $n = <>;

say factorial($n);

my $it = permutation_iterator([1..$n]);
say join ' ', $it->() foreach 1..factorial($n);

sub permutation_iterator {
    my $list = shift;

    my $size = @$list;
    my $n = 0; # the n-th permutation

    sub {
        my @list = @$list;
        my @select;
        my $i = $n;

        for (my $k = 1; $k <= $size; ++$k) {
            unshift @select, $i % $k;
            $i = int($i / $k);
        }

        $n = ( [@select] ~~ [(0)x$size] and $n > 0 ) ? 0 : $n + 1;

        map { splice @list, $_, 1 } @select;
    }
}

sub factorial {
    my $n = shift;
    my $x = 1;
    while ($n > 0) {
        $x *= $n--;
    }
    $x;
}
