package BioTables;

use common::sense;
use Exporter 'import';

our @EXPORT_OK = qw(aa2mass mass2aa rna2aa aa2rna);

my %aa2mass = qw (
                     A   71.03711
                     C   103.00919
                     D   115.02694
                     E   129.04259
                     F   147.06841
                     G   57.02146
                     H   137.05891
                     I   113.08406
                     K   128.09496
                     L   113.08406
                     M   131.04049
                     N   114.04293
                     P   97.05276
                     Q   128.05858
                     R   156.10111
                     S   87.03203
                     T   101.04768
                     V   99.06841
                     W   186.07931
                     Y   163.06333
             );

my %mass2aa;

sub aa2mass { return { %aa2mass }; }
sub mass2aa {
    unless (%mass2aa) {
        %mass2aa = map { $aa2mass{$_} => $_ } keys %aa2mass;
    }

    return { %mass2aa };
}

my %rna2aa = qw(
                   UUU F      CUU L      AUU I      GUU V
                   UUC F      CUC L      AUC I      GUC V
                   UUA L      CUA L      AUA I      GUA V
                   UUG L      CUG L      AUG M      GUG V
                   UCU S      CCU P      ACU T      GCU A
                   UCC S      CCC P      ACC T      GCC A
                   UCA S      CCA P      ACA T      GCA A
                   UCG S      CCG P      ACG T      GCG A
                   UAU Y      CAU H      AAU N      GAU D
                   UAC Y      CAC H      AAC N      GAC D
                   UAA *      CAA Q      AAA K      GAA E
                   UAG *      CAG Q      AAG K      GAG E
                   UGU C      CGU R      AGU S      GGU G
                   UGC C      CGC R      AGC S      GGC G
                   UGA *      CGA R      AGA R      GGA G
                   UGG W      CGG R      AGG R      GGG G
           );

my %aa2rna;

sub rna2aa { return { %rna2aa }; }
sub aa2rna {
    unless (%aa2rna) {
        while (my ($rna, $aa) = each %rna2aa) {
            push @{$aa2rna{$aa}}, $rna;
        }
    }

    return { %aa2rna };
}

__PACKAGE__
