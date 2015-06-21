use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter;

# ABSTRACT: a simple plug-in based, staged text filter for Markdown translation

our $VERSION = '1.000001';

# AUTHORITY


=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);
    use CPAN::Changes::Markdown::Filter;
    my $filter = CPAN::Changes::Markdown::Filter->new(
        rules => [ rule_NumericToCode ]
    );

=cut

use Moo 1.000008 qw( with has );
use CPAN::Changes::Markdown::Filter::NodeUtil qw(mk_node_plaintext);

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter"
}

=end MetaPOD::JSON

=cut

with 'CPAN::Changes::Markdown::Role::Filter';

=attr C<rules>

=method C<rules>

=cut

has rules => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    [];
  },
);

=method C<process>

    my $output = $filter->process( $input );

=cut

sub process {
  my ( $self, $input ) = @_;
  my (@input) = ( mk_node_plaintext($input) );
  for my $rule ( @{ $self->rules } ) {
    @input = $rule->filter(@input);
  }
  return join q{}, map { $_->to_s } @input;
}

1;
