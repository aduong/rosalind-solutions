use common::sense;

use constant GUARD => [];

my $set_size = <>;

my @set     = (1)x$set_size;
my @subset1 = (0)x$set_size;
my @subset2 = (0)x$set_size;
unshift @set,     GUARD;
unshift @subset1, GUARD;
unshift @subset2, GUARD;

$subset1[$_] = 1 foreach split /, /, substr scalar(<>), 1, -2;
$subset2[$_] = 1 foreach split /, /, substr scalar(<>), 1, -2;

say_set(set_union(\@subset1, \@subset2));
say_set(set_intersect(\@subset1, \@subset2));
say_set(set_difference(\@subset1, \@subset2));
say_set(set_difference(\@subset2, \@subset1));
say_set(set_difference(\@set, \@subset1));
say_set(set_difference(\@set, \@subset2));

sub set_union {
    my @union = @{shift;};

    for my $set (@_) {
        for my $i (1..$set_size) {
            $union[$i] = 1 if $set->[$i];
        }
    }

    \@union;
}

sub set_intersect {
    my @intersection = @{shift;};

    for my $set (@_) {
        for my $i (1..$set_size) {
            $intersection[$i] = 0 unless $set->[$i];
        }
    }

    \@intersection;
}

sub set_difference {
    my @difference = @{shift;};

    for my $set (@_) {
        for my $i (1..$set_size) {
            $difference[$i] = 0 if $set->[$i];
        }
    }

    \@difference;
}

sub say_set {
    my $set = shift;

    my @set;
    for (1..$set_size) {
        push @set, $_ if $set->[$_];
    }

    say '{', join(', ', @set), '}';
}
