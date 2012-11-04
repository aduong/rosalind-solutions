use common::sense;

chomp(my $haystack = <>);
chomp(my $needle = <>);

my @indices;
my $j = 0;
for my $i (0..(length($haystack) - 1)) {
    if (substr($haystack, $i, 1) eq substr($needle, $j, 1)) {
        push @indices, $i;
        ++$j;
    }
}

if (@indices == length($needle)) {
    say join ' ', map { $_ + 1 } @indices;
}
# else no subseq
