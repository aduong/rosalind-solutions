use common::sense;

my $set_size = <>;

my @u  = (1)x($set_size+1);
my @s1 = (0)x($set_size+1);
my @s2 = (0)x($set_size+1);

$u[0]     = 0; # our universe doesn't include 0 :(

$s1[$_] = 1 foreach split /, /, substr scalar(<>), 1, -2;
$s2[$_] = 1 foreach split /, /, substr scalar(<>), 1, -2;

set_say(set_union(\@s1, \@s2));
set_say(set_intersect(\@s1, \@s2));
set_say(set_difference(\@s1, \@s2));
set_say(set_difference(\@s2, \@s1));
set_say(set_difference(\@u, \@s1));
set_say(set_difference(\@u, \@s2));

sub set_union {
    my @union = @{shift;};

    for my $set (@_) {
        for my $i (0..$set_size) {
            $union[$i] = 1 if $set->[$i];
        }
    }

    \@union;
}

sub set_intersect {
    my @intersection = @{shift;};

    for my $set (@_) {
        for my $i (0..$set_size) {
            $intersection[$i] = 0 unless $set->[$i];
        }
    }

    \@intersection;
}

sub set_difference {
    my @difference = @{shift;};

    for my $set (@_) {
        for my $i (0..$set_size) {
            $difference[$i] = 0 if $set->[$i];
        }
    }

    \@difference;
}

sub set_say {
    my $set = shift;

    my @set;
    for (1..$set_size) {
        push @set, $_ if $set->[$_];
    }

    say '{', join(', ', @set), '}';
}
