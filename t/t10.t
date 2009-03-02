use Test::More qw(no_plan);

use Math::Permute::List;

my $a;

permute {++$a} 1..10;

ok $a == 10*9*8*7*6*5*4*3*2;
