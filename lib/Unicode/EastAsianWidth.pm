# $File: //member/autrijus/Unicode-EastAsianWidth/lib/Unicode/EastAsianWidth.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 949 $DateTime: $

package Unicode::EastAsianWidth;
$Unicode::EastAsianWidth::VERSION = '1.00';

use 5.006;
use strict;
use base 'Exporter';

our $EastAsian;

=head1 NAME

Unicoe::EastAsianWidth - East Asian Width properties

=head1 VERSION

This document describes version 1.00 of Unicode::EastAsianWidth.

=head1 SYNOPSIS

    use Unicode::EastAsianWidth;

    $_ = chr(0x2588); # FULL BLOCK, an ambiguous-width character

    /\p{InEastAsianAmbiguous}/;	# true
    /\p{InFullwidth}/;		# false

    {
	local $Unicode::EastAsianWidth::EastAsian = 1;
	/\p{InFullwidth}/;	# true; only works on perl 5.8+
    }

=head1 DESCRIPTION

This module provide user-defined unicode properties that
deals with East Asian character's width status, as specified
in L<http://www.unicode.org/unicode/reports/tr11/>.

It exports following functions to the caller's scope, to be
used by Perl's Unicode matching system: C<InEastAsianFullwidth>,
C<InEastAsianHalfwidth>, C<InEastAsianAmbiguous>, C<InEastAsianNarrow>
C<InEastAsianWide>, C<InEastAsianNeutral>.

According to the technical report listed above, two additional
context-sensitive properties are exported: C<InFullwidth>
(union of I<Fullwidth> and I<Wide>) and C<InHalfwidth> (union of
Halfwidth, I<Narrow> and I<Neutral>).

I<Ambiguous> characters are treated by default as part of
C<InHalfwidth>, but you can modify this behaviour by assigning
a true value to C<$Unicode::EastAsianWidth::EastAsian>.

=head1 CAVEATS

Setting C<$Unicode::EastAsianWidth::EastAsian> at run-time only
works on Perl version 5.8 or above.  Perl 5.6 users must use
a BEGIN block to set it before the C<use> statement:

	BEGIN { $Unicode::EastAsianWidth::EastAsian = 1 }
	use Unicode::EastAsianWidth;

=cut

sub InFullwidth {
    return InEastAsianFullwidth().
	   InEastAsianWide().
	   ($EastAsian ? InEastAsianAmbiguous() : '');
}

sub InHalfwidth {
    return InEastAsianHalfwidth().
	   InEastAsianNarrow().
	   InEastAsianNeutral().
	   ($EastAsian ? '' : InEastAsianAmbiguous());
}

### BEGIN ###
our @EXPORT = qw(
InEastAsianFullwidth
InEastAsianHalfwidth
InEastAsianAmbiguous
InEastAsianNarrow
InEastAsianWide
InEastAsianNeutral
InFullwidth
InHalfwidth
);

sub InEastAsianAmbiguous {
    return <<END;
00A1\t00A1
00A4\t00A4
00A7\t00A8
00AA\t00AA
00AD\t00AE
00B0\t00B4
00B6\t00BA
00BC\t00BF
00C6\t00C6
00D0\t00D0
00D7\t00D8
00DE\t00E1
00E6\t00E6
00E8\t00EA
00EC\t00ED
00F0\t00F0
00F2\t00F3
00F7\t00FA
00FC\t00FC
00FE\t00FE
0101\t0101
0111\t0111
0113\t0113
011B\t011B
0126\t0127
012B\t012B
0131\t0133
0138\t0138
013F\t0142
0144\t0144
0148\t014B
014D\t014D
0152\t0153
0166\t0167
016B\t016B
01CE\t01CE
01D0\t01D0
01D2\t01D2
01D4\t01D4
01D6\t01D6
01D8\t01D8
01DA\t01DA
01DC\t01DC
0251\t0251
0261\t0261
02C4\t02C4
02C7\t02C7
02C9\t02CB
02CD\t02CD
02D0\t02D0
02D8\t02DB
02DD\t02DD
02DF\t02DF
0300\t034F
0360\t036F
0391\t03A1
03A3\t03A9
03B1\t03C1
03C3\t03C9
0401\t0401
0410\t044F
0451\t0451
2010\t2010
2013\t2016
2018\t2019
201C\t201D
2020\t2022
2024\t2027
2030\t2030
2032\t2033
2035\t2035
203B\t203B
203E\t203E
2074\t2074
207F\t207F
2081\t2084
20AC\t20AC
2103\t2103
2105\t2105
2109\t2109
2113\t2113
2116\t2116
2121\t2122
2126\t2126
212B\t212B
2153\t2154
215B\t215E
2160\t216B
2170\t2179
2190\t2199
21B8\t21B9
21D2\t21D2
21D4\t21D4
21E7\t21E7
2200\t2200
2202\t2203
2207\t2208
220B\t220B
220F\t220F
2211\t2211
2215\t2215
221A\t221A
221D\t2220
2223\t2223
2225\t2225
2227\t222C
222E\t222E
2234\t2237
223C\t223D
2248\t2248
224C\t224C
2252\t2252
2260\t2261
2264\t2267
226A\t226B
226E\t226F
2282\t2283
2286\t2287
2295\t2295
2299\t2299
22A5\t22A5
22BF\t22BF
2312\t2312
2460\t24E9
24EB\t24FE
2500\t254B
2550\t2573
2580\t258F
2592\t2595
25A0\t25A1
25A3\t25A9
25B2\t25B3
25B6\t25B7
25BC\t25BD
25C0\t25C1
25C6\t25C8
25CB\t25CB
25CE\t25D1
25E2\t25E5
25EF\t25EF
2605\t2606
2609\t2609
260E\t260F
261C\t261C
261E\t261E
2640\t2640
2642\t2642
2660\t2661
2663\t2665
2667\t266A
266C\t266D
266F\t266F
273D\t273D
2776\t277F
FE00\tFE0F
FFFD\tFFFD
END
}
sub InEastAsianFullwidth {
    return <<END;
3000\t3000
FF01\tFF60
FFE0\tFFE6
END
}
sub InEastAsianHalfwidth {
    return <<END;
20A9\t20A9
FF61\tFFBE
FFC2\tFFC7
FFCA\tFFCF
FFD2\tFFD7
FFDA\tFFDC
FFE8\tFFEE
END
}
sub InEastAsianNeutral {
    return <<END;
0000\t001F
007F\t00A0
00A9\t00A9
00AB\t00AB
00B5\t00B5
00BB\t00BB
00C0\t00C5
00C7\t00CF
00D1\t00D6
00D9\t00DD
00E2\t00E5
00E7\t00E7
00EB\t00EB
00EE\t00EF
00F1\t00F1
00F4\t00F6
00FB\t00FB
00FD\t00FD
00FF\t0100
0102\t0110
0112\t0112
0114\t011A
011C\t0125
0128\t012A
012C\t0130
0134\t0137
0139\t013E
0143\t0143
0145\t0147
014C\t014C
014E\t0151
0154\t0165
0168\t016A
016C\t01CD
01CF\t01CF
01D1\t01D1
01D3\t01D3
01D5\t01D5
01D7\t01D7
01D9\t01D9
01DB\t01DB
01DD\t0220
0222\t0233
0250\t0250
0252\t0260
0262\t02AD
02B0\t02C3
02C5\t02C6
02C8\t02C8
02CC\t02CC
02CE\t02CF
02D1\t02D7
02DC\t02DC
02DE\t02DE
02E0\t02EE
0374\t0375
037A\t037A
037E\t037E
0384\t038A
038C\t038C
038E\t0390
03AA\t03B0
03C2\t03C2
03CA\t03CE
03D0\t03F6
0400\t0400
0402\t040F
0450\t0450
0452\t0486
0488\t04CE
04D0\t04F5
04F8\t04F9
0500\t050F
0531\t0556
0559\t055F
0561\t0587
0589\t058A
0591\t05A1
05A3\t05B9
05BB\t05C4
05D0\t05EA
05F0\t05F4
060C\t060C
061B\t061B
061F\t061F
0621\t063A
0640\t0655
0660\t06ED
06F0\t06FE
0700\t070D
070F\t072C
0730\t074A
0780\t07B1
0901\t0903
0905\t0939
093C\t094D
0950\t0954
0958\t0970
0981\t0983
0985\t098C
098F\t0990
0993\t09A8
09AA\t09B0
09B2\t09B2
09B6\t09B9
09BC\t09BC
09BE\t09C4
09C7\t09C8
09CB\t09CD
09D7\t09D7
09DC\t09DD
09DF\t09E3
09E6\t09FA
0A02\t0A02
0A05\t0A0A
0A0F\t0A10
0A13\t0A28
0A2A\t0A30
0A32\t0A33
0A35\t0A36
0A38\t0A39
0A3C\t0A3C
0A3E\t0A42
0A47\t0A48
0A4B\t0A4D
0A59\t0A5C
0A5E\t0A5E
0A66\t0A74
0A81\t0A83
0A85\t0A8B
0A8D\t0A8D
0A8F\t0A91
0A93\t0AA8
0AAA\t0AB0
0AB2\t0AB3
0AB5\t0AB9
0ABC\t0AC5
0AC7\t0AC9
0ACB\t0ACD
0AD0\t0AD0
0AE0\t0AE0
0AE6\t0AEF
0B01\t0B03
0B05\t0B0C
0B0F\t0B10
0B13\t0B28
0B2A\t0B30
0B32\t0B33
0B36\t0B39
0B3C\t0B43
0B47\t0B48
0B4B\t0B4D
0B56\t0B57
0B5C\t0B5D
0B5F\t0B61
0B66\t0B70
0B82\t0B83
0B85\t0B8A
0B8E\t0B90
0B92\t0B95
0B99\t0B9A
0B9C\t0B9C
0B9E\t0B9F
0BA3\t0BA4
0BA8\t0BAA
0BAE\t0BB5
0BB7\t0BB9
0BBE\t0BC2
0BC6\t0BC8
0BCA\t0BCD
0BD7\t0BD7
0BE7\t0BF2
0C01\t0C03
0C05\t0C0C
0C0E\t0C10
0C12\t0C28
0C2A\t0C33
0C35\t0C39
0C3E\t0C44
0C46\t0C48
0C4A\t0C4D
0C55\t0C56
0C60\t0C61
0C66\t0C6F
0C82\t0C83
0C85\t0C8C
0C8E\t0C90
0C92\t0CA8
0CAA\t0CB3
0CB5\t0CB9
0CBE\t0CC4
0CC6\t0CC8
0CCA\t0CCD
0CD5\t0CD6
0CDE\t0CDE
0CE0\t0CE1
0CE6\t0CEF
0D02\t0D03
0D05\t0D0C
0D0E\t0D10
0D12\t0D28
0D2A\t0D39
0D3E\t0D43
0D46\t0D48
0D4A\t0D4D
0D57\t0D57
0D60\t0D61
0D66\t0D6F
0D82\t0D83
0D85\t0D96
0D9A\t0DB1
0DB3\t0DBB
0DBD\t0DBD
0DC0\t0DC6
0DCA\t0DCA
0DCF\t0DD4
0DD6\t0DD6
0DD8\t0DDF
0DF2\t0DF4
0E01\t0E3A
0E3F\t0E5B
0E81\t0E82
0E84\t0E84
0E87\t0E88
0E8A\t0E8A
0E8D\t0E8D
0E94\t0E97
0E99\t0E9F
0EA1\t0EA3
0EA5\t0EA5
0EA7\t0EA7
0EAA\t0EAB
0EAD\t0EB9
0EBB\t0EBD
0EC0\t0EC4
0EC6\t0EC6
0EC8\t0ECD
0ED0\t0ED9
0EDC\t0EDD
0F00\t0F47
0F49\t0F6A
0F71\t0F8B
0F90\t0F97
0F99\t0FBC
0FBE\t0FCC
0FCF\t0FCF
1000\t1021
1023\t1027
1029\t102A
102C\t1032
1036\t1039
1040\t1059
10A0\t10C5
10D0\t10F8
10FB\t10FB
1160\t11A2
11A8\t11F9
1200\t1206
1208\t1246
1248\t1248
124A\t124D
1250\t1256
1258\t1258
125A\t125D
1260\t1286
1288\t1288
128A\t128D
1290\t12AE
12B0\t12B0
12B2\t12B5
12B8\t12BE
12C0\t12C0
12C2\t12C5
12C8\t12CE
12D0\t12D6
12D8\t12EE
12F0\t130E
1310\t1310
1312\t1315
1318\t131E
1320\t1346
1348\t135A
1361\t137C
13A0\t13F4
1401\t1676
1680\t169C
16A0\t16F0
1700\t170C
170E\t1714
1720\t1736
1740\t1753
1760\t176C
176E\t1770
1772\t1773
1780\t17DC
17E0\t17E9
1800\t180E
1810\t1819
1820\t1877
1880\t18A9
1E00\t1E9B
1EA0\t1EF9
1F00\t1F15
1F18\t1F1D
1F20\t1F45
1F48\t1F4D
1F50\t1F57
1F59\t1F59
1F5B\t1F5B
1F5D\t1F5D
1F5F\t1F7D
1F80\t1FB4
1FB6\t1FC4
1FC6\t1FD3
1FD6\t1FDB
1FDD\t1FEF
1FF2\t1FF4
1FF6\t1FFE
2000\t200F
2011\t2012
2017\t2017
201A\t201B
201E\t201F
2023\t2023
2028\t202F
2031\t2031
2034\t2034
2036\t203A
203C\t203D
203F\t2052
2057\t2057
205F\t2063
206A\t2071
2075\t207E
2080\t2080
2085\t208E
20A0\t20A8
20AA\t20AB
20AD\t20B1
20D0\t20EA
2100\t2102
2104\t2104
2106\t2108
210A\t2112
2114\t2115
2117\t2120
2123\t2125
2127\t212A
212C\t213A
213D\t214B
2155\t215A
215F\t215F
216C\t216F
217A\t2183
219A\t21B7
21BA\t21D1
21D3\t21D3
21D5\t21E6
21E8\t21FF
2201\t2201
2204\t2206
2209\t220A
220C\t220E
2210\t2210
2212\t2214
2216\t2219
221B\t221C
2221\t2222
2224\t2224
2226\t2226
222D\t222D
222F\t2233
2238\t223B
223E\t2247
2249\t224B
224D\t2251
2253\t225F
2262\t2263
2268\t2269
226C\t226D
2270\t2281
2284\t2285
2288\t2294
2296\t2298
229A\t22A4
22A6\t22BE
22C0\t2311
2313\t2328
232B\t23CE
2400\t2426
2440\t244A
24EA\t24EA
254C\t254F
2574\t257F
2590\t2591
2596\t259F
25A2\t25A2
25AA\t25B1
25B4\t25B5
25B8\t25BB
25BE\t25BF
25C2\t25C5
25C9\t25CA
25CC\t25CD
25D2\t25E1
25E6\t25EE
25F0\t2604
2607\t2608
260A\t260D
2610\t2613
2616\t2617
2619\t261B
261D\t261D
261F\t263F
2641\t2641
2643\t265F
2662\t2662
2666\t2666
266B\t266B
266E\t266E
2670\t267D
2680\t2689
2701\t2704
2706\t2709
270C\t2727
2729\t273C
273E\t274B
274D\t274D
274F\t2752
2756\t2756
2758\t275E
2761\t2775
2780\t2794
2798\t27AF
27B1\t27BE
27D0\t27E5
27F0\t2984
2987\t2AFF
303F\t303F
FB00\tFB06
FB13\tFB17
FB1D\tFB36
FB38\tFB3C
FB3E\tFB3E
FB40\tFB41
FB43\tFB44
FB46\tFBB1
FBD3\tFD3F
FD50\tFD8F
FD92\tFDC7
FDF0\tFDFC
FE20\tFE23
FE70\tFE74
FE76\tFEFC
FEFF\tFEFF
FFF9\tFFFC
10300\t1031E
10320\t10323
10330\t1034A
10400\t10425
10428\t1044D
1D000\t1D0F5
1D100\t1D126
1D12A\t1D1DD
1D400\t1D454
1D456\t1D49C
1D49E\t1D49F
1D4A2\t1D4A2
1D4A5\t1D4A6
1D4A9\t1D4AC
1D4AE\t1D4B9
1D4BB\t1D4BB
1D4BD\t1D4C0
1D4C2\t1D4C3
1D4C5\t1D505
1D507\t1D50A
1D50D\t1D514
1D516\t1D51C
1D51E\t1D539
1D53B\t1D53E
1D540\t1D544
1D546\t1D546
1D54A\t1D550
1D552\t1D6A3
1D6A8\t1D7C9
1D7CE\t1D7FF
E0001\tE0001
END
}
sub InEastAsianNarrow {
    return <<END;
0020\t007E
00A2\t00A3
00A5\t00A6
00AC\t00AC
00AF\t00AF
27E6\t27EB
2985\t2986
END
}
sub InEastAsianWide {
    return <<END;
1100\t1159
115F\t115F
2329\t232A
2E80\t2E99
2E9B\t2EF3
2F00\t2FD5
2FF0\t2FFB
3001\t303E
3041\t3096
3099\t30FF
3105\t312C
3131\t318E
3190\t31B7
31F0\t321C
3220\t3243
3251\t327B
327F\t32CB
32D0\t32FE
3300\t3376
337B\t33DD
33E0\t33FE
A000\tA48C
A490\tA4C6
F900\tFA2D
FA30\tFA6A
FE30\tFE46
FE49\tFE52
FE54\tFE66
FE68\tFE6B
2F800\t2FA1D
END
}
### END ###

1;

=head1 SEE ALSO

L<perlunicode>,
L<http://www.unicode.org/unicode/reports/tr11/>

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2002 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
