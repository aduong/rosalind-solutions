use common::sense;

<>;

my $seq = '';
while (<>) {
    chomp;
    $seq .= $_;
}

my @profile = (0)x(4 ** 4);
for my $offset (0..(length($seq)-4)) {
    $profile[str2idx(substr($seq, $offset, 4))]++;
}

say join ' ', @profile;

sub str2idx {
    my $string = shift;
    return unless length($string) == 4;
    atcg_ord(substr($string, 0, 1)) * 4 * 4 * 4
  + atcg_ord(substr($string, 1, 1)) * 4 * 4
  + atcg_ord(substr($string, 2, 1)) * 4
  + atcg_ord(substr($string, 3, 1));
}

sub atcg_ord {
    $_[0] eq 'A' ? 0 :
    $_[0] eq 'C' ? 1 :
    $_[0] eq 'G' ? 2 :
                   3 ;
}
