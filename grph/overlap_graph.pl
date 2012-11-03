use common::sense;

my $line = <>;
my $id;

my %suffix2id;
my %seqs;

while (defined $line) {
    my $id = substr $line, 1, -1;

    my $seq = '';
    while (defined($line = <>) and $line !~ /^>/) {
        chomp $line;
        $seq .= $line;
    }

    my $head = substr $seq, 0, 3;
    my $tail = substr $seq, -3;

    $seqs{$id} = $head;;
    push @{$suffix2id{$tail}}, $id;
}

while (my ($id, $head) = each %seqs) {
    foreach my $suf_id (@{$suffix2id{$head}}) {
        next if $suf_id eq $id;
        say $suf_id, ' ', $id;
    }
}
