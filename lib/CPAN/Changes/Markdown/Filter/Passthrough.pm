use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Passthrough;
BEGIN {
  $CPAN::Changes::Markdown::Filter::Passthrough::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::Passthrough::VERSION = '0.2.0';
}


use Moo;

with 'CPAN::Changes::Markdown::Role::Filter';

sub process {
  return $_[1];
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Passthrough

=head1 VERSION

version 0.2.0

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Passthrough",
    "interface":"class",
    "does":"CPAN::Changes::Markdown::Role::Filter",
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
