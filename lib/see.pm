package see;

use strict;
use warnings;
our $VERSION = '0.01';
use Exporter 'import';
use Class::Inspector;
our @EXPORT = qw/see/;

sub see {
    my $caller = caller(0);
    my $target = @_!=0 ? $_[0] : $caller;
       $target = ref $target ? ref $target : $target;
    my @functions = @{ Class::Inspector->functions($target) };
    if (@_==2) {
        @functions = grep { $_ =~ $_[1] } @functions;
    }
    return wantarray ? @functions : \@functions;
}

1;
__END__

=head1 NAME

see -

=head1 SYNOPSIS

    > use see;

    > see();
    $VAR1 = 'see';

    > package Foo; sub new { bless {}, shift } sub meth1 { }
    > see(Foo->new())
    $VAR1 = 'meth1';
    $VAR2 = 'new';

    > see(Foo->new(), qr/^meth/);
    $VAR1 = 'meth1';

=head1 DESCRIPTION

see is inspector module for REPL.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom  slkjfd gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
