use common::sense;

chomp(my $str = <>);
my @failure = (0) x length($str);

my ($i, $j) = (0, 1);

while ($j < @failure) {
    if (substr($str, $i, 1) eq substr($str, $j, 1)) {
        $failure[$j] = ++$i;
        ++$j;
    }
    elsif ($i > 0) {
        $i = $failure[$i - 1];
    }
    else {
        $i = 0;
        ++$j;
    }
}

say join ' ', @failure;
