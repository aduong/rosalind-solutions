use common::sense;

my @strings = map { chomp; $_ } <>;
my $length = length($strings[0]);

my %profile = map {
    $_ => [ (0)x$length ]
} qw(A T C G);

for my $idx (0..($length - 1)) {
    my ($max_base, $max_count);

    foreach (@strings) {
        my $base = substr $_, $idx, 1;
        my $count = ++$profile{$base}[$idx];

        ($max_base, $max_count) = ($base, $count) if $count > $max_count;
    }

    print $max_base;
}
print "\n";

for my $base (sort keys %profile) {
    say $base, ': ', join ' ', @{$profile{$base}};
}
