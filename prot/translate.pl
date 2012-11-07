use common::sense;
use BioTables qw(rna2aa);

my $rna2aa = rna2aa();

my $seq;

while (<>) {
    chomp;
    $seq .= $_;
}

for my $codon ($seq =~ /(.{3})/g) {
    (my $aa = $rna2aa->{$codon}) eq '*' and last;
    print $aa;
}
print "\n";
