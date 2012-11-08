package Permutor;

use common::sense;
use Exporter 'import';
use List::Util 'reduce';
use Memoize;

our @EXPORT = qw(permutation_iterator factorial);

memoize('factorial');

sub permutation_iterator {
    my $list = shift;

    my $size = @$list;
    my $max = factorial($size);
    my $n = 0; # the n-th permutation

    sub {
        return if $n >= $max;
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
    reduce { $a * $b } 1, 1..shift;
}

__PACKAGE__
