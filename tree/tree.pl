use common::sense;

my $num_nodes = <>;

my @node_component = 0..$num_nodes;
my @neighbours;

while (my $line = <>) {
    my ($a, $b) = split /\s+/, $line;

    push @{$neighbours[$a]}, $b;
    push @{$neighbours[$b]}, $a;
}

my @visited;
for my $node (1..$num_nodes) {
    dft($node, \@visited);
}

shift @node_component; # dummy node at beginning for 1-indexing

my @components = do {
    my %u = map { $_ => 1 } @node_component;
    sort { $a <=> $b } keys %u;
};

say @components - 1;

sub dft {
    my $node    = shift;
    my $visited = shift;
    $visited->[$node] ||= 1;

    for my $n (@{$neighbours[$node]}) {
        next if $visited->[$n];

        $node_component[$n] = $node_component[$node];
        dft($n, $visited);
    }
}
