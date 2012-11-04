use common::sense;
use List::Util 'reduce';

my %aa2multiplicity = qw(
                            A 4 C 2 D 2 E 2 F 2 G 4 H 2 I 3
                            K 2 L 6 M 1 N 2 P 4 Q 2 R 6 S 6
                            T 4 V 4 W 1 Y 2 Stop 3
                    );

chomp(my $prot = <>);
my $mrnas = reduce { ($a * $b) % 1_000_000 } 3,
            map { $aa2multiplicity{$_} } split //, $prot;

say $mrnas;
