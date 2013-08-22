
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::NodeUtil;
BEGIN {
  $CPAN::Changes::Markdown::Filter::NodeUtil::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::NodeUtil::VERSION = '0.1.1';
}


use Sub::Exporter::Progressive -setup => {
    exports => [ qw( mk_node_plaintext mk_node_delimitedtext ) ]
};

sub mk_node_plaintext {
    require CPAN::Changes::Markdown::Filter::Node::PlainText;
    return CPAN::Changes::Markdown::Filter::Node::PlainText->create(@_);
}

sub mk_node_delimitedtext {
    require CPAN::Changes::Markdown::Filter::Node::DelimitedText;
    return CPAN::Changes::Markdown::Filter::Node::DelimitedText->create(@_);
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::NodeUtil

=head1 VERSION

version 0.1.1

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::NodeUtil",
    "interface":"exporter"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
