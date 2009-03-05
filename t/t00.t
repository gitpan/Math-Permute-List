use Test::More qw(no_plan);

=pod

An important test: the code block supplied to permute should not be
called.

=cut


use Math::Permute::List;

my $a = '';

ok 0 == permute {$a .= "@_\n"} ();

ok $a eq '';

