use common::sense;

my @alpha = split /\s+/, scalar <>;
my $k = <>;

for my $i (0..(@alpha ** $k - 1)) {
    my @kmer;

    for (1..$k) {
        unshift @kmer, $alpha[$i % @alpha];
        $i /= @alpha;
    }

    say join '', @kmer;
}
