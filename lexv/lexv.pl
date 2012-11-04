use common::sense;

my @alpha = split /\s+/, scalar <>;
my $length = <>;

say foreach build_strings(\@alpha, $length);

sub build_strings {
    my $alpha  = shift;
    my $length = shift;

    return  @$alpha if $length <= 1;

    my @strings;

    for my $ch (@$alpha) {
        push @strings, $ch, map { $ch . $_ } build_strings($alpha, $length-1);
    }

    @strings;
}
