use common::sense;
use List::MoreUtils 'each_array';

chomp(my $str1 = <>);
chomp(my $str2 = <>);

die unless length($str1) == length($str2);

my $dist;

my @str1 = split //, $str1;
my @str2 = split //, $str2;

my $it = each_array(@str1, @str2);
while (my ($ch1, $ch2) = $it->()) {
    $dist += $ch1 ne $ch2;
}

say $dist;
