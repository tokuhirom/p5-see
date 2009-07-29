use Test::More tests => 3;

sub is_array($$) {
    my ($a1, $a2) = @_;
    my $b1 = join ',', sort @$a1;
    my $b2 = join ',', sort @$a2;
    ::is $b1, $b2;
}

{
    package SampleObject;
    sub new { bless {}, shift }
    sub meth1 { }
    sub meth2 { }
}

do {
    package CleanRoom::r1;
    use see 'see';
    ::is_array scalar(see()), ['see'];
};

do {
    package CleanRoom::r2;
    use see 'see';
    ::is_array scalar(see(SampleObject->new([]))), [qw/meth1 meth2 new/];
};

do {
    package CleanRoom::r3;
    use see 'see';
    ::is_array scalar(see(SampleObject->new([]), qr/^meth.+/)), [qw/meth1 meth2/];
};

