use common::sense;
use BioTables qw(aa2mass);
use ExtendedSearch qw(closest_binary_search);

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
