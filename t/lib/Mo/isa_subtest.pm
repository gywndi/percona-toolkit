BEGIN {
   require Scalar::Util::PP;
   *Scalar::Util:: = \*Scalar::Util::PP::;
   $INC{"Scalar/Util.pm"} = __FILE__;
};

BEGIN {
   die "The PERCONA_TOOLKIT_BRANCH environment variable is not set.\n"
      unless $ENV{PERCONA_TOOLKIT_BRANCH} && -d $ENV{PERCONA_TOOLKIT_BRANCH};
   unshift @INC, "$ENV{PERCONA_TOOLKIT_BRANCH}/lib";
};

use strict;
use warnings;

{
   package isa_subtest;
   use Mo;

   has attr => (
      is  => 'rw',
      isa => 'Int',
   );

   1;
}

isa_subtest->new(attr => 100);
