use Test::More qw(no_plan);

my $a = '';

use Math::Permute::List;

permute {$a .= "@_\n"} 1..2;

ok $a eq << 'end';
1 2
2 1
end

