use strict;
use warnings;
 
package CPAN::Changes::Markdown::Filter;
BEGIN {
  $CPAN::Changes::Markdown::Filter::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::VERSION = '0.1.1';
}

use Moo 1.000008;
use CPAN::Changes::Markdown::Filter::NodeUtil qw(mk_node_plaintext);


with 'CPAN::Changes::Markdown::Role::Filter';

has rules => ( is => ro =>, lazy => 1, builder => sub {
    []
});

sub process {
    my ( $self, $input ) = @_;
    my ( @input ) = ( mk_node_plaintext($input) ); 
    for my $rule ( @{ $self->rules } ) {
        @input = $rule->filter( @input );
    }
    return join q{}, map { $_->to_s } @input;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter

=head1 VERSION

version 0.1.1

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
