use common::sense;

chomp(my $string = <>);
chomp(my $pattern = <>);

my $strlen = length($string);
my $patlen = length($pattern);

# can do faster by pre-processing

my @matched_idxs = grep {
    substr($string, $_ - 1, $patlen) eq $pattern
} (1..($strlen - $patlen));

say join ' ', @matched_idxs;
