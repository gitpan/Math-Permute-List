#!perl -w -I../..

=head1 Name

Math::Permute::List - Generate all permutations of a list.

=head1 Synopsis

use Math::Permute::List;

permute {say "@_"} 1..3;

  1 2 3
  1 3 2
  2 1 3
  3 1 2
  2 3 1
  3 2 1

=cut

use strict;

package Math::Permute::List;

sub permute(&@)
 {my $s = shift;       # Subroutine to call to process each permutation

  my $n = scalar(@_);  # Size of array to be permuted
  my $l = 0;           # Item being permuted           
  my @p = (0)x($n+1);  # Current permutations
  my @P = @_;          # Array to permute   
  my @Q = ();          # Permuted array     

  my $p; $p = sub      # Generate each permutation
   {if ($l < $n) 
     {for(1..$n)
       {if (!$p[$_])
         {$Q[$_-1] = $P[$l];
          $p[$_]   = ++$l;
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

  &$p if $n;
  1
 }

# Export details
 
require 5.006;
require Exporter;

use vars qw(@ISA @EXPORT $VERSION);

@ISA     = qw(Exporter);
@EXPORT  = qw(permute);
$VERSION = '1.0';

=head1 Description

Math::Permute::List generates all the permutations of a list using the
standard Perl metaphor. Its easy to use and fast. Its written in 100%
Pure Perl.

Please note that the order in which the permutations are generated is
not guaranteed, so please do not rely on it.

=head1 Export

The C<permute()> function is exported by default.

=head1 Installation

Standard Module::Build process for building ans installing modules:

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

=head1 See Also

L<Algorithm::Permute>
L<Algorithm::FastPermute>

=head1 Copyright

Copyright (c) 2009 Philip R Brenan
This module is free software. It may be used, redistributed
and/or modified under the same terms as Perl itself.

=cut
