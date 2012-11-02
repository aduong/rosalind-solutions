use common::sense;

my $line = <>;
for my $gc (split /\s+/, $line) {
    my $at = 1-$gc;

    print(($at * $at + $gc * $gc)/2, ' ');
}
print "\n";
