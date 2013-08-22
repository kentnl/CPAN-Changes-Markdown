use strict;
use warnings;
 
package CPAN::Changes::Markdown::Role::Filter::Rule::PlainText;
BEGIN {
  $CPAN::Changes::Markdown::Role::Filter::Rule::PlainText::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Role::Filter::Rule::PlainText::VERSION = '0.1.1';
}

# ABSTRACT: A rule that only filters plaintext nodes.

use Role::Tiny;

requires 'filter_plaintext';
with 'CPAN::Changes::Markdown::Role::Filter::Rule';


sub filter {
  my ( $self, @input ) = @_;
  my @output;
  for my $input ( @input ) {
      if ( not $input->isa('CPAN::Changes::Markdown::Filter::Node::PlainText' ) ) {
          push @output, $input;
          next;
      }
      push @output, $self->filter_plaintext( $input );
  }
  return @output;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Role::Filter::Rule::PlainText - A rule that only filters plaintext nodes.

=head1 VERSION

version 0.1.1

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText",
    "interface":"role",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
