#!/usr/bin/perl -w
# $File: //member/autrijus/Unicode-EastAsianWidth/t/1-basic.t $ $Author: autrijus $
# $Revision: #2 $ $Change: 949 $ $DateTime: 2002/09/20 04:46:49 $

use strict;
use Test;

BEGIN { plan tests => 4 }

ok (eval { use Unicode::EastAsianWidth; 1 });

$_ = chr(0x2588);
ok (/\p{InEastAsianAmbiguous}/);
ok (!/\p{InFullwidth}/);

{
    local $Unicode::EastAsianWidth::EastAsian = 1;
    skip($] < 5.008, /\p{InFullwidth}/);
}

__END__
