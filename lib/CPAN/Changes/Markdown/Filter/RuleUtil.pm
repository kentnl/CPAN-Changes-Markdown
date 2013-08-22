
use strict;
use warnings;
 
package CPAN::Changes::Markdown::Filter::RuleUtil;
BEGIN {
  $CPAN::Changes::Markdown::Filter::RuleUtil::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::RuleUtil::VERSION = '0.1.1';
}



use Sub::Exporter::Progressive -setup => {
    exports => [ qw( rule_NumericsToCode rule_UnderscoredToCode rule_PackageNamesToCode rule_VersionsToCode ) ]
};

sub rule_NumericsToCode {
    require CPAN::Changes::Markdown::Filter::Rule::NumericsToCode;
    return CPAN::Changes::Markdown::Filter::Rule::NumericsToCode->new(@_);
}

sub rule_UnderscoredToCode {
    require CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode;
    return CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode->new(@_);
}

sub rule_PackageNamesToCode {
    require CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode;
    return CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode->new(@_);
}

sub rule_VersionsToCode {
    require CPAN::Changes::Markdown::Filter::Rule::VersionsToCode;
    return CPAN::Changes::Markdown::Filter::Rule::VersionsToCode->new(@_);
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::RuleUtil

=head1 VERSION

version 0.1.1

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::RuleUtil",
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
