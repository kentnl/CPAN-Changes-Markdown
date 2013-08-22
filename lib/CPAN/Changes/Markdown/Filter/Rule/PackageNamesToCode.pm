use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode;
BEGIN {
  $CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode::VERSION = '0.1.1';
}

# ABSTRACT: Quote things that look like Perl Package names to Code

use Moo;
use CPAN::Changes::Markdown::Filter::NodeUtil qw( mk_node_plaintext mk_node_delimitedtext );



with "CPAN::Changes::Markdown::Role::Filter::Rule::PlainText";

my $lc_package_chars = 'a-z0-9';
my $package_chars    = 'A-Z' . $lc_package_chars;

my $re_camelnoun = qr/(\A|\A.*?\s) ( [A-Z][$lc_package_chars]+(?: [A-Z][$package_chars]* )+ ) (\z|\s.*\z)/msx;
my $re_prefix    = qr/(\A|\A.*?\s) ( ::[$package_chars]+ (?: ::[$package_chars]+)*       ) (\z|\s.*\z)/msx;
my $re_suffix    = qr/(\A|\A.*?\s) ( (?: [$package_chars]+:: )* [$package_chars]+::      ) (\z|\s.*\z)/msx;
my $re_infix     = qr/(\A|\A.*?\s) ( [$package_chars]+   (?: ::[$package_chars]+)+       ) (\z|\s.*\z)/msx;

sub _inject_code_delim {
  my ( $self, $out, $before, $code, $after ) = @_;
  push @{$out}, mk_node_plaintext($before);
  push @{$out}, mk_node_delimitedtext( '`', $code, '`' );
  push @{$out}, $self->filter_plaintext( mk_node_plaintext($after) );
  return @{$out};
}

sub filter_plaintext {
  my ( $self, $input ) = @_;
  if ( $input->content =~ $re_camelnoun ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  if ( $input->content =~ $re_prefix ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  if ( $input->content =~ $re_suffix ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  if ( $input->content =~ $re_infix ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  return $input;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode - Quote things that look like Perl Package names to Code

=head1 VERSION

version 0.1.1

=head1 SYNOPSIS

This filter translates things that resemble package names (but not simply nouns) into codeblocks.

=over 4

=item * ::foo

=item * foo::

=item * foo::foo

=item * foo::foo::foo ...etc 

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
