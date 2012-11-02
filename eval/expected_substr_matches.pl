use common::sense;

my ($substr_length, $target_length) = split /\s+/, scalar <>;
my @gcs = split /\s+/, scalar <>;

say join ' ', map {
    my $gc = $_;

    my $p_one_match = ($gc ** 2 + (1 - $gc) ** 2) / 2;
    my $p = $p_one_match ** $substr_length;

    my $num_possible_substrs = $target_length - $substr_length + 1;

    $num_possible_substrs * $p;
} @gcs;
