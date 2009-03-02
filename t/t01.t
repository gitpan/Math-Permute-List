use Test::More qw(no_plan);

my $a = '';

use Math::Permute::List;

permute {$a .= "@_\n"} 1..1;

ok $a eq << 'end';
1
end

