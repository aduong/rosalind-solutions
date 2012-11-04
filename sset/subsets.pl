use common::sense;

my $set_size = <>;
my $num_subsets = 2 ** $set_size;

say $num_subsets;

for my $subset (0..($num_subsets - 1)) {
    my @subset;
    for my $i (1..$set_size) {
        push @subset, $i if $subset & 1;
        $subset >>= 1;
    }

    say '{', join(', ', @subset), '}';
}
