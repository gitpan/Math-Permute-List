=head1 Name

Math::Permute::List - Generate all permutations of a list.

=head1 Synopsis

 use Math::Permute::List;

 permute {say "@_"} qw(a b c);

 #  a b c
 #  a c b
 #  b a c
 #  c a b
 #  b c a
 #  c b a

=cut

use strict;

package Math::Permute::List;

sub permute(&@)
 {my $s = shift;       # Subroutine to call to process each permutation

  my $n = scalar(@_);  # Size of array to be permuted
  return 0 unless $n;  # Empty lists cannot be permuted
  my $l = 0;           # Item being permuted           
  my @p = ();          # Current permutations
  my @P = @_;          # Array to permute   
  my @Q = ();          # Permuted array     

  my $p; $p = sub      # Generate each permutation
   {if ($l < $n) 
     {for(0..$n-1)
       {if (!$p[$_])
         {$Q[$_] = $P[$l];
          $p[$_] = ++$l;
          &$p();
          --$l;
          $p[$_] = 0;
         }
       }
     }
    else 
     {&$s(@Q);
     }
   };

  &$p;
  
  my $i = 1; $i *= $_ for 2..$n;
  $i                   # Number of permutations 
 }

# Export details
 
require 5;
require Exporter;

use vars qw(@ISA @EXPORT $VERSION);

@ISA     = qw(Exporter);
@EXPORT  = qw(permute);
$VERSION = '1.001';

=head1 Description

Generate and process all the all the permutations of a list using the
standard Perl metaphor. 

C<permute()> returns the number of permutations in both scalar and array
context.

Its easy to use and fast. Its written in 100% Pure Perl.

Please note that the order in which the permutations are generated is
not guaranteed, so please do not rely on it.

=head1 Export

The C<permute()> function is exported.

=head1 Installation

Standard Module::Build process for building and installing modules:

  perl Build.PL
  ./Build
  ./Build test
  ./Build install

Or, if you're on a platform (like DOS or Windows) that doesn't require
the "./" notation, you can do this:

  perl Build.PL
  Build
  Build test
  Build install

=head1 Author

PhilipRBrenan@handybackup.com

http://www.handybackup.com

=head1 See Also

L<Math::Disarrange::List>
L<Algorithm::Permute>
L<Algorithm::FastPermute>

=head1 Copyright

Copyright (c) 2009 Philip R Brenan.

This module is free software. It may be used, redistributed and/or
modified under the same terms as Perl itself.

=cut
