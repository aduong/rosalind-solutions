use common::sense;

while (<>) {
    chomp;
    tr/ATCGatcg/TAGCtagc/;
    say scalar(reverse($_));
}
