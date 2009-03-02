#!perl -w

=pod

Build the CPAN distribution for this project

=cut

use Module::Build;
use File::Copy;

for(qw(lib lib/Math lib/Math/Permute))
 {mkdir or die $! unless -d;
 }
copy("List.pm", "lib/Math/Permute/List.pm");

my $b = Module::Build->new
 (module_name => 'Math::Permute::List',
  dist_abstract=><<'END',
Generate all permutations of a list.
END
  license=>'perl',
  author=>'PhilipRBrenan@handybackup.com',
 );

$b->create_build_script() 

