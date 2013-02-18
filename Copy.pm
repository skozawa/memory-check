package Copy;

sub new {
    my $class = shift;
    bless {}, $class;
}

sub copy {
    my ($self, $buff) = @_;
    my $res = $buff;
    $res;
}

1;

