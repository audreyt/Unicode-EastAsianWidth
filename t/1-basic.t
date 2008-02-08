#!/usr/bin/perl -w

use strict;
use Test;

BEGIN { plan tests => (($] >= 5.008) ? 6 : 5) }

use Unicode::EastAsianWidth;

ok(Unicode::EastAsianWidth->VERSION);

$_ = chr(0x2010);
ok(/\p{InEastAsianAmbiguous}/);
ok(!/\p{InFullwidth}/);

$_ = chr(0x4E00);
ok(/\p{InFullwidth}/);
ok(!/\p{InEastAsianAmbiguous}/);

if ($] >= 5.008) {
    no warnings 'once';
    local $Unicode::EastAsianWidth::EastAsian = 1;
    ok(/\p{InFullwidth}/);
}

__END__
