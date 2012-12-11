use common::sense;

my ($homodom, $hetero, $homorec) = split /\s+/, scalar <>;
my $total = $homodom + $hetero + $homorec;

my $prob = 1
         -     $homorec / $total * ($homorec - 1) / ($total - 1)
         - 2 * $homorec / $total *    $hetero     / ($total - 1) * 0.5
         -     $hetero  / $total * ($hetero  - 1) / ($total - 1) * 0.25;

say $prob;
