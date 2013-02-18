use v5.14;
use strict;
use warnings;

use lib glob "modules/*/lib";

use Devel::MemUsed;
use Copy;

my $mem_used = Devel::MemUsed->new;

$mem_used->reset;
say $mem_used->used; ## 160

# $mem_used->reset;
# my $buff = 'a' x 1000;
# say $mem_used->used; ## 2208

# $mem_used->reset;
# {
#     my $buff = 'a' x 1000;
# }
# say $mem_used->used; ## 2208

# $mem_used->reset;
# my $buff = 'a' x 1000;
# undef $buff;
# say $mem_used->used; ## 1184


# $mem_used->reset;
# my $buff = 'a' x 1000;
# $buff = copy($buff);
# say $mem_used->used; ## 4288

# $mem_used->reset;
# my $buff = 'a' x 1000;
# $buff = copy($buff);
# $buff = copy($buff);
# say $mem_used->used; ## 4288

# $mem_used->reset;
# my $buff = 'a' x 1000;
# $buff = copy2($buff);
# say $mem_used->used; ## 3248

# $mem_used->reset;
# my $buff = 'a' x 1000;
# my $copy = Copy->new;
# $buff = $copy->copy($buff);
# say $mem_used->used; ## 4688

# $mem_used->reset;
# my $buff = 'a' x 1000;
# my $copy = Copy->new;
# $buff = $copy->copy($buff);
# undef $copy;
# say $mem_used->used; ## 4688

sub copy {
    my ($buff) = @_;
    my $res = $buff;
    $res;
}

sub copy2 {
    my ($buff) = @_;
    my $res = $buff;
    undef $buff;
    $res;
}

