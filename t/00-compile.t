use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.033

use Test::More  tests => 15 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'CPAN/Changes/Markdown.pm',
    'CPAN/Changes/Markdown/Filter.pm',
    'CPAN/Changes/Markdown/Filter/Node/DelimitedText.pm',
    'CPAN/Changes/Markdown/Filter/Node/PlainText.pm',
    'CPAN/Changes/Markdown/Filter/NodeUtil.pm',
    'CPAN/Changes/Markdown/Filter/Passthrough.pm',
    'CPAN/Changes/Markdown/Filter/Rule/NumericsToCode.pm',
    'CPAN/Changes/Markdown/Filter/Rule/PackageNamesToCode.pm',
    'CPAN/Changes/Markdown/Filter/Rule/UnderscoredToCode.pm',
    'CPAN/Changes/Markdown/Filter/Rule/VersionsToCode.pm',
    'CPAN/Changes/Markdown/Filter/RuleUtil.pm',
    'CPAN/Changes/Markdown/Role/Filter.pm',
    'CPAN/Changes/Markdown/Role/Filter/Node.pm',
    'CPAN/Changes/Markdown/Role/Filter/Rule.pm',
    'CPAN/Changes/Markdown/Role/Filter/Rule/PlainText.pm'
);



# no fake home requested

use File::Spec;
use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, '-Mblib', '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


