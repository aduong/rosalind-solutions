use common::sense;

my ($best_id, $best_gc);

my $line = <>;
while (defined $line) {
    my $id = substr $line, 1, -1;
    my $seq = '';

    while (defined($line = <>) and $line !~ /^>/) {
        chomp $line;
        $seq .= $line;
    }

    if ( (my $gc = gc($seq)) > $best_gc) {
        ($best_gc, $best_id) = ($gc, $id);
    }
}

say $best_id;
say $best_gc * 100, '%';

sub gc {
    my $str = shift;
    ($str =~ tr/GgCc/GgCc/) / length($str);
}
