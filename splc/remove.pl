use common::sense;

chomp(my $dna = <>);
while (my $intron = <>) {
    chomp $intron;
    $dna =~ s/\Q$intron\E//g;
}

say $dna;
