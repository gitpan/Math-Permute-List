use Test::More qw(no_plan);

=pod

An important test: the code block supplied to permute should not be
called.

=cut

my $a = '';

use Math::Permute::List;

permute {$a .= "@_\n"} ();

ok $a eq '';

