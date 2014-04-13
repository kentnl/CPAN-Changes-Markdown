use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Role::Filter::Node;

# ABSTRACT: A parse node of some kind

# AUTHORITY

use Role::Tiny qw( requires );

=requires C<to_s>

=cut

requires 'to_s';

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"role"
}

=end MetaPOD::JSON

=cut

1;
