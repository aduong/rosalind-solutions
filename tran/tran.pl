use common::sense;

my @seqs;

my $line = <>;
while (defined $line) {
    last unless $line =~ /^>/;
    my $seq = '';
    while ($line = <>) {
        last if $line =~ /^>/;
        chomp($seq .= $line)
    }

    push @seqs, $seq;
}

die unless @seqs == 2;

my ($transitions, $transversions) = (0,0);
for my $i (0..(length($seqs[0])-1)) {
    my ($a, $b) = (substr($seqs[0], $i, 1), substr($seqs[1], $i, 1));
    say $a, ' ', $b;

    next if $a eq $b;

    given ([$a,$b]) {
        when (['A','G']) { ++$transitions }
        when (['G','A']) { ++$transitions }
        when (['C','T']) { ++$transitions }
        when (['T','C']) { ++$transitions }
        default          { ++$transversions }
    }
}

say $transitions/$transversions;
