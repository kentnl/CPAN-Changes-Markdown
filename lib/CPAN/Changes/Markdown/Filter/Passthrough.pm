use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::Passthrough;

# ABSTRACT: A Filter drop-in that doesn't process anything.

our $VERSION = '1.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY






















use Moo qw( with );

with 'CPAN::Changes::Markdown::Role::Filter';





## no critic (RequireArgUnpacking)

sub process {
  return $_[1];
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Passthrough - A Filter drop-in that doesn't process anything.

=head1 VERSION

version 1.000001

=head1 SYNOPSIS

    my $filter = CPAN::Changes::Markdown::Filter::Passthrough->new();
    my $output = $filter->process( $input );
    # $output == $input

=head1 METHODS

=head2 C<process>

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

This software is copyright (c) 2015 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
