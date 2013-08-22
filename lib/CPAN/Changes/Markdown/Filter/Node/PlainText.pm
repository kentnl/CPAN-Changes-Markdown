
use strict;
use warnings;
 
package CPAN::Changes::Markdown::Filter::Node::PlainText;
BEGIN {
  $CPAN::Changes::Markdown::Filter::Node::PlainText::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::Node::PlainText::VERSION = '0.1.1';
}


use Moo;

with 'CPAN::Changes::Markdown::Role::Filter::Node';

has content => ( is => rw =>, required => 1 );

sub create {
    my ( $self, $content ) = @_;
    return $self->new( content => $content );
}

sub substr {
    my ($self, $start, $length ) = @_;
    my $content = substr $self->content, $start, $length;
    return __PACKAGE__->new( content => $content );
}

sub to_s {
    my ( $self, ) = @_;
    return $self->content;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Node::PlainText

=head1 VERSION

version 0.1.1

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::PlainText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
