use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Rule::NumericsToCode;

# ABSTRACT: Quote things that look like numbers as code entries.

our $VERSION = '1.000002';

# AUTHORITY

use Moo qw( with has );
use CPAN::Changes::Markdown::Filter::NodeUtil qw( mk_node_plaintext mk_node_delimitedtext );

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Rule::NumericsToCode",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText"
}

=end MetaPOD::JSON

=cut

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);

    my $instance = rule_NumericsToCode( @args );

=cut

with 'CPAN::Changes::Markdown::Role::Filter::Rule::PlainText';

sub _inject_code_delim {
  my ( $self, $out, $before, $code, $after ) = @_;
  push @{$out}, mk_node_plaintext($before);
  push @{$out}, mk_node_delimitedtext( q{`}, $code, q{`} );
  push @{$out}, $self->filter_plaintext( mk_node_plaintext($after) );
  return @{$out};
}

# _Pulp__5010_qr_m_propagate_properly
## no critic (Compatibility::PerlMinimumVersionAndWhy)
my $re_contains_number = qr/         \d                  /msx;
my $re_numeric         = qr/ (\A|\A.*?\s) ( [\d._]+ ) (\z|\s.*\z)/msx;
## use critic

=method C<filter_plaintext>

=cut

sub filter_plaintext {
  my ( $self, $input ) = @_;
  if ( $input->content !~ $re_contains_number ) {
    return $input;
  }
  if ( $input->content =~ $re_numeric ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  return $input;
}

1;
