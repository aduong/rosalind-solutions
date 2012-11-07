use common::sense;
use BioTables qw(aa2mass);

my $aa2mass = aa2mass();

my @masses = sort { $a->[0] <=> $b->[0] }
             map { [ $aa2mass->{$_} => $_ ] }
             keys %$aa2mass;

my $prev_mass = <>;
while (my $mass = <>) {
    my $delta = $mass - $prev_mass;
    my $idx = closest_binary_search(\@masses, [$delta], sub { $_[0][0] - $_[1][0] } );

    print $masses[$idx][1];

    $prev_mass = $mass;
}
print "\n";

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
