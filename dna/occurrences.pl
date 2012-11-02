use common::sense;

while (<>) {
    my $a_count = $_ =~ tr/Aa//d;
    my $t_count = $_ =~ tr/Tt//d;
    my $c_count = $_ =~ tr/Cc//d;
    my $g_count = $_ =~ tr/Gg//d;

    say join ' ', $a_count, $c_count, $g_count, $t_count;
}

