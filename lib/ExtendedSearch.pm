package ExtendedSearch;

use common::sense;
use Exporter 'import';

our @EXPORT = qw(closest_binary_search);

sub closest_binary_search {
    my $list    = shift;
    my $x       = shift;
    my $diff_op = shift // sub { $_[0] - $_[1] };

    my ($lower, $upper) = (0, $#$list);
    my $mid;

    while ($upper - $lower > 1) {
        $mid = ($lower + $upper) >> 1;
        my $diff = $diff_op->($x, $list->[$mid]);
        if ($diff < 0) {
            $upper = $mid;
        }
        elsif ($diff > 0) {
            $lower = $mid;
        }
        else {
            return $mid;
        }
    }

    return $lower if abs($diff_op->($x, $list->[$lower]))
                   < abs($diff_op->($x, $list->[$upper]));
    $upper;
}

__PACKAGE__
