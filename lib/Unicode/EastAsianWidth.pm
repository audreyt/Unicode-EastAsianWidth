package Unicode::EastAsianWidth;

use 5.006;
use strict;
use base 'Exporter';
use vars qw( $VERSION $EastAsian );

BEGIN {
    $VERSION = '14.0';
    $EastAsian = 0;
};

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
InEastAsianAmbiguous
InEastAsianFullwidth
InEastAsianHalfwidth
InEastAsianNarrow
InEastAsianNeutral
InEastAsianWide
InFullwidth
InHalfwidth
);

sub InEastAsianAmbiguous {
    return <<"END";
00A1\t00A1
00A4\t00A4
00A7\t00A8
00AA\t00AA
00AD\t00AE
00B0\t00B1
00B2\t00B3
00B4\t00B4
00B6\t00B7
00B8\t00BA
00BC\t00BE
00BF\t00BF
00C6\t00C6
00D0\t00D0
00D7\t00D8
00DE\t00E1
00E6\t00E6
00E8\t00EA
00EC\t00ED
00F0\t00F0
00F2\t00F3
00F7\t00F7
00F8\t00FA
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
0300\t036F
0391\t03A1
03A3\t03A9
03B1\t03C1
03C3\t03C9
0401\t0401
0410\t044F
0451\t0451
2010\t2010
2013\t2015
2016\t2016
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
2189\t2189
2190\t2194
2195\t2199
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
2460\t249B
249C\t24E9
24EB\t24FF
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
269E\t269F
26BF\t26BF
26C6\t26CD
26CF\t26D3
26D5\t26E1
26E3\t26E3
26E8\t26E9
26EB\t26F1
26F4\t26F4
26F6\t26F9
26FB\t26FC
26FE\t26FF
273D\t273D
2776\t277F
2B56\t2B59
3248\t324F
E000\tF8FF
FE00\tFE0F
FFFD\tFFFD
1F100\t1F10A
1F110\t1F12D
1F130\t1F169
1F170\t1F18D
1F18F\t1F190
1F19B\t1F1AC
E0100\tE01EF
F0000\tFFFFD
100000\t10FFFD
END
}

sub InEastAsianFullwidth {
    return <<"END";
3000\t3000
FF01\tFF03
FF04\tFF04
FF05\tFF07
FF08\tFF0D
FF0E\tFF0F
FF10\tFF19
FF1A\tFF1B
FF1C\tFF1E
FF1F\tFF20
FF21\tFF3A
FF3B\tFF40
FF41\tFF5A
FF5B\tFF60
FFE0\tFFE1
FFE2\tFFE4
FFE5\tFFE6
END
}

sub InEastAsianHalfwidth {
    return <<"END";
20A9\t20A9
FF61\tFF63
FF64\tFF65
FF66\tFF6F
FF70\tFF70
FF71\tFF9D
FF9E\tFF9F
FFA0\tFFBE
FFC2\tFFC7
FFCA\tFFCF
FFD2\tFFD7
FFDA\tFFDC
FFE8\tFFE8
FFE9\tFFEC
FFED\tFFEE
END
}

sub InEastAsianNarrow {
    return <<"END";
0020\t0020
0021\t0023
0024\t0024
0025\t0027
0028\t002D
002E\t002F
0030\t0039
003A\t003B
003C\t003E
003F\t0040
0041\t005A
005B\t0060
0061\t007A
007B\t007E
00A2\t00A3
00A5\t00A6
00AC\t00AC
00AF\t00AF
27E6\t27ED
2985\t2986
END
}

sub InEastAsianNeutral {
    return <<"END";
0000\t001F
007F\t007F
0080\t009F
00A0\t00A0
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
016C\t017F
0180\t01BA
01BB\t01BB
01BC\t01BF
01C0\t01C3
01C4\t01CD
01CF\t01CF
01D1\t01D1
01D3\t01D3
01D5\t01D5
01D7\t01D7
01D9\t01D9
01DB\t01DB
01DD\t024F
0250\t0250
0252\t0260
0262\t0293
0294\t0294
0295\t02AF
02B0\t02C1
02C2\t02C3
02C5\t02C6
02C8\t02C8
02CC\t02CC
02CE\t02CF
02D1\t02D1
02D2\t02D7
02DC\t02DC
02DE\t02DE
02E0\t02E4
02E5\t02EB
02EC\t02EE
02EF\t02FF
0370\t0373
0374\t0375
0376\t0377
037A\t037A
037B\t037D
037E\t037F
0384\t0385
0386\t0387
0388\t038A
038C\t038C
038E\t0390
03AA\t03B0
03C2\t03C2
03CA\t03F5
03F6\t03F6
03F7\t03FF
0400\t0400
0402\t040F
0450\t0450
0452\t0481
0482\t0482
0483\t0487
0488\t0489
048A\t04FF
0500\t052F
0531\t0556
0559\t0559
055A\t055F
0560\t0588
0589\t058A
058D\t058E
058F\t058F
0591\t05BD
05BE\t05C0
05C1\t05C2
05C3\t05C3
05C4\t05C5
05C6\t05C7
05D0\t05EA
05EF\t05F2
05F3\t05F4
0600\t0605
0606\t0608
0609\t060A
060B\t060B
060C\t060D
060E\t060F
0610\t061A
061B\t061C
061D\t061F
0620\t063F
0640\t0640
0641\t064A
064B\t065F
0660\t0669
066A\t066D
066E\t066F
0670\t0670
0671\t06D3
06D4\t06D5
06D6\t06DC
06DD\t06DE
06DF\t06E4
06E5\t06E6
06E7\t06E8
06E9\t06E9
06EA\t06ED
06EE\t06EF
06F0\t06F9
06FA\t06FC
06FD\t06FE
06FF\t06FF
0700\t070D
070F\t0711
0712\t072F
0730\t074A
074D\t074F
0750\t077F
0780\t07A5
07A6\t07B0
07B1\t07B1
07C0\t07C9
07CA\t07EA
07EB\t07F3
07F4\t07F5
07F6\t07F6
07F7\t07F9
07FA\t07FD
07FE\t07FF
0800\t0815
0816\t0819
081A\t081A
081B\t0823
0824\t0824
0825\t0827
0828\t0828
0829\t082D
0830\t083E
0840\t0858
0859\t085B
085E\t085E
0860\t086A
0870\t0887
0888\t0888
0889\t088E
0890\t0891
0898\t089F
08A0\t08C8
08C9\t08C9
08CA\t08E1
08E2\t08E2
08E3\t08FF
0900\t0902
0903\t0903
0904\t0939
093A\t093D
093E\t0940
0941\t0948
0949\t094C
094D\t094D
094E\t094F
0950\t0950
0951\t0957
0958\t0961
0962\t0963
0964\t0965
0966\t096F
0970\t0971
0972\t097F
0980\t0981
0982\t0983
0985\t098C
098F\t0990
0993\t09A8
09AA\t09B0
09B2\t09B2
09B6\t09B9
09BC\t09BD
09BE\t09C0
09C1\t09C4
09C7\t09C8
09CB\t09CC
09CD\t09D7
09DC\t09DD
09DF\t09E1
09E2\t09E3
09E6\t09EF
09F0\t09F1
09F2\t09F3
09F4\t09F9
09FA\t09FE
0A01\t0A02
0A03\t0A03
0A05\t0A0A
0A0F\t0A10
0A13\t0A28
0A2A\t0A30
0A32\t0A33
0A35\t0A36
0A38\t0A39
0A3C\t0A3C
0A3E\t0A40
0A41\t0A42
0A47\t0A48
0A4B\t0A4D
0A51\t0A51
0A59\t0A5C
0A5E\t0A5E
0A66\t0A6F
0A70\t0A71
0A72\t0A74
0A75\t0A76
0A81\t0A82
0A83\t0A83
0A85\t0A8D
0A8F\t0A91
0A93\t0AA8
0AAA\t0AB0
0AB2\t0AB3
0AB5\t0AB9
0ABC\t0ABD
0ABE\t0AC0
0AC1\t0AC5
0AC7\t0AC8
0AC9\t0AC9
0ACB\t0ACC
0ACD\t0AD0
0AE0\t0AE1
0AE2\t0AE3
0AE6\t0AEF
0AF0\t0AF9
0AFA\t0AFF
0B01\t0B01
0B02\t0B03
0B05\t0B0C
0B0F\t0B10
0B13\t0B28
0B2A\t0B30
0B32\t0B33
0B35\t0B39
0B3C\t0B40
0B41\t0B44
0B47\t0B48
0B4B\t0B4C
0B4D\t0B4D
0B55\t0B56
0B57\t0B57
0B5C\t0B5D
0B5F\t0B61
0B62\t0B63
0B66\t0B6F
0B70\t0B71
0B72\t0B77
0B82\t0B83
0B85\t0B8A
0B8E\t0B90
0B92\t0B95
0B99\t0B9A
0B9C\t0B9C
0B9E\t0B9F
0BA3\t0BA4
0BA8\t0BAA
0BAE\t0BB9
0BBE\t0BBF
0BC0\t0BC0
0BC1\t0BC2
0BC6\t0BC8
0BCA\t0BCC
0BCD\t0BD7
0BE6\t0BEF
0BF0\t0BF2
0BF3\t0BF8
0BF9\t0C00
0C01\t0C03
0C04\t0C04
0C05\t0C0C
0C0E\t0C10
0C12\t0C28
0C2A\t0C39
0C3C\t0C3D
0C3E\t0C40
0C41\t0C44
0C46\t0C48
0C4A\t0C4D
0C55\t0C56
0C58\t0C5A
0C5D\t0C5D
0C60\t0C61
0C62\t0C63
0C66\t0C6F
0C77\t0C77
0C78\t0C7E
0C7F\t0C81
0C82\t0C83
0C84\t0C84
0C85\t0C8C
0C8E\t0C90
0C92\t0CA8
0CAA\t0CB3
0CB5\t0CB9
0CBC\t0CBF
0CC0\t0CC4
0CC6\t0CC6
0CC7\t0CC8
0CCA\t0CCB
0CCC\t0CCD
0CD5\t0CD6
0CDD\t0CDE
0CE0\t0CE1
0CE2\t0CE3
0CE6\t0CEF
0CF1\t0CF2
0D00\t0D01
0D02\t0D03
0D04\t0D0C
0D0E\t0D10
0D12\t0D3A
0D3B\t0D3C
0D3D\t0D3D
0D3E\t0D40
0D41\t0D44
0D46\t0D48
0D4A\t0D4C
0D4D\t0D4F
0D54\t0D56
0D57\t0D57
0D58\t0D5E
0D5F\t0D61
0D62\t0D63
0D66\t0D6F
0D70\t0D78
0D79\t0D79
0D7A\t0D7F
0D81\t0D81
0D82\t0D83
0D85\t0D96
0D9A\t0DB1
0DB3\t0DBB
0DBD\t0DBD
0DC0\t0DC6
0DCA\t0DCA
0DCF\t0DD1
0DD2\t0DD4
0DD6\t0DD6
0DD8\t0DDF
0DE6\t0DEF
0DF2\t0DF3
0DF4\t0DF4
0E01\t0E30
0E31\t0E31
0E32\t0E33
0E34\t0E3A
0E3F\t0E3F
0E40\t0E45
0E46\t0E46
0E47\t0E4E
0E4F\t0E4F
0E50\t0E59
0E5A\t0E5B
0E81\t0E82
0E84\t0E84
0E86\t0E8A
0E8C\t0EA3
0EA5\t0EA5
0EA7\t0EB0
0EB1\t0EB1
0EB2\t0EB3
0EB4\t0EBC
0EBD\t0EBD
0EC0\t0EC4
0EC6\t0EC6
0EC8\t0ECD
0ED0\t0ED9
0EDC\t0EDF
0F00\t0F00
0F01\t0F03
0F04\t0F12
0F13\t0F14
0F15\t0F17
0F18\t0F19
0F1A\t0F1F
0F20\t0F29
0F2A\t0F33
0F34\t0F3D
0F3E\t0F3F
0F40\t0F47
0F49\t0F6C
0F71\t0F7E
0F7F\t0F7F
0F80\t0F84
0F85\t0F85
0F86\t0F87
0F88\t0F8C
0F8D\t0F97
0F99\t0FBC
0FBE\t0FC5
0FC6\t0FC6
0FC7\t0FCC
0FCE\t0FCF
0FD0\t0FD4
0FD5\t0FD8
0FD9\t0FDA
1000\t102A
102B\t102C
102D\t1030
1031\t1031
1032\t1037
1038\t1038
1039\t103A
103B\t103C
103D\t103E
103F\t103F
1040\t1049
104A\t104F
1050\t1055
1056\t1057
1058\t1059
105A\t105D
105E\t1060
1061\t1061
1062\t1064
1065\t1066
1067\t106D
106E\t1070
1071\t1074
1075\t1081
1082\t1082
1083\t1084
1085\t1086
1087\t108C
108D\t108F
1090\t1099
109A\t109C
109D\t109D
109E\t109F
10A0\t10C5
10C7\t10CD
10D0\t10FA
10FB\t10FC
10FD\t10FF
1160\t11FF
1200\t1248
124A\t124D
1250\t1256
1258\t1258
125A\t125D
1260\t1288
128A\t128D
1290\t12B0
12B2\t12B5
12B8\t12BE
12C0\t12C0
12C2\t12C5
12C8\t12D6
12D8\t1310
1312\t1315
1318\t135A
135D\t135F
1360\t1368
1369\t137C
1380\t138F
1390\t1399
13A0\t13F5
13F8\t13FD
1400\t1400
1401\t166C
166D\t166E
166F\t167F
1680\t1680
1681\t169A
169B\t169C
16A0\t16EA
16EB\t16ED
16EE\t16F0
16F1\t16F8
1700\t1711
1712\t1714
1715\t171F
1720\t1731
1732\t1733
1734\t1734
1735\t1736
1740\t1751
1752\t1753
1760\t176C
176E\t1770
1772\t1773
1780\t17B3
17B4\t17B5
17B6\t17B6
17B7\t17BD
17BE\t17C5
17C6\t17C6
17C7\t17C8
17C9\t17D3
17D4\t17D6
17D7\t17D7
17D8\t17DA
17DB\t17DD
17E0\t17E9
17F0\t17F9
1800\t1805
1806\t1806
1807\t180A
180B\t180D
180E\t180F
1810\t1819
1820\t1842
1843\t1843
1844\t1878
1880\t1884
1885\t1886
1887\t18A8
18A9\t18AA
18B0\t18F5
1900\t191E
1920\t1922
1923\t1926
1927\t1928
1929\t192B
1930\t1931
1932\t1932
1933\t1938
1939\t193B
1940\t1940
1944\t1945
1946\t194F
1950\t196D
1970\t1974
1980\t19AB
19B0\t19C9
19D0\t19D9
19DA\t19DA
19DE\t19DF
19E0\t19FF
1A00\t1A16
1A17\t1A18
1A19\t1A1A
1A1B\t1A1B
1A1E\t1A1F
1A20\t1A54
1A55\t1A57
1A58\t1A5E
1A60\t1A62
1A63\t1A64
1A65\t1A6C
1A6D\t1A72
1A73\t1A7C
1A7F\t1A7F
1A80\t1A89
1A90\t1A99
1AA0\t1AA6
1AA7\t1AA7
1AA8\t1AAD
1AB0\t1ABD
1ABE\t1ABE
1ABF\t1ACE
1B00\t1B03
1B04\t1B04
1B05\t1B33
1B34\t1B35
1B36\t1B3A
1B3B\t1B3C
1B3D\t1B41
1B42\t1B42
1B43\t1B44
1B45\t1B4C
1B50\t1B59
1B5A\t1B60
1B61\t1B6A
1B6B\t1B73
1B74\t1B7C
1B7D\t1B7E
1B80\t1B81
1B82\t1B82
1B83\t1BA0
1BA1\t1BA1
1BA2\t1BA5
1BA6\t1BA7
1BA8\t1BA9
1BAA\t1BAA
1BAB\t1BAD
1BAE\t1BAF
1BB0\t1BB9
1BBA\t1BBF
1BC0\t1BE5
1BE6\t1BE7
1BE8\t1BE9
1BEA\t1BEC
1BED\t1BEE
1BEF\t1BF1
1BF2\t1BF3
1BFC\t1BFF
1C00\t1C23
1C24\t1C2B
1C2C\t1C33
1C34\t1C35
1C36\t1C37
1C3B\t1C3F
1C40\t1C49
1C4D\t1C4F
1C50\t1C59
1C5A\t1C77
1C78\t1C7D
1C7E\t1C7F
1C80\t1C88
1C90\t1CBA
1CBD\t1CBF
1CC0\t1CC7
1CD0\t1CD2
1CD3\t1CD3
1CD4\t1CE0
1CE1\t1CE1
1CE2\t1CE8
1CE9\t1CEC
1CED\t1CED
1CEE\t1CF3
1CF4\t1CF4
1CF5\t1CF6
1CF7\t1CF7
1CF8\t1CF9
1CFA\t1CFA
1D00\t1D2B
1D2C\t1D6A
1D6B\t1D77
1D78\t1D78
1D79\t1D7F
1D80\t1D9A
1D9B\t1DBF
1DC0\t1DFF
1E00\t1EFF
1F00\t1F15
1F18\t1F1D
1F20\t1F45
1F48\t1F4D
1F50\t1F57
1F59\t1F5D
1F5F\t1F7D
1F80\t1FB4
1FB6\t1FBC
1FBD\t1FBE
1FBF\t1FC1
1FC2\t1FC4
1FC6\t1FCC
1FCD\t1FCF
1FD0\t1FD3
1FD6\t1FDB
1FDD\t1FDF
1FE0\t1FEC
1FED\t1FEF
1FF2\t1FF4
1FF6\t1FFC
1FFD\t1FFE
2000\t200A
200B\t200F
2011\t2012
2017\t2017
201A\t201B
201E\t201F
2023\t2023
2028\t2029
202A\t202E
202F\t202F
2031\t2031
2034\t2034
2036\t2038
2039\t203A
203C\t203D
203F\t2040
2041\t2043
2044\t2046
2047\t2051
2052\t2054
2055\t205E
205F\t205F
2060\t2064
2066\t206F
2070\t2071
2075\t2079
207A\t207C
207D\t207E
2080\t2080
2085\t2089
208A\t208C
208D\t208E
2090\t209C
20A0\t20A8
20AA\t20AB
20AD\t20C0
20D0\t20DC
20DD\t20E0
20E1\t20E1
20E2\t20E4
20E5\t20F0
2100\t2101
2102\t2102
2104\t2104
2106\t2108
210A\t2112
2114\t2115
2117\t2118
2119\t211D
211E\t2120
2123\t2125
2127\t212A
212C\t212D
212E\t212E
212F\t2134
2135\t2138
2139\t2139
213A\t213B
213C\t213F
2140\t2144
2145\t2149
214A\t214B
214C\t214D
214E\t214F
2150\t2152
2155\t215A
215F\t215F
216C\t216F
217A\t2182
2183\t2184
2185\t2188
218A\t218B
219A\t219B
219C\t219F
21A0\t21A0
21A1\t21A2
21A3\t21A3
21A4\t21A5
21A6\t21A6
21A7\t21AD
21AE\t21AE
21AF\t21B7
21BA\t21CD
21CE\t21CF
21D0\t21D1
21D3\t21D3
21D5\t21E6
21E8\t21F3
21F4\t21FF
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
22C0\t22FF
2300\t2307
2308\t230B
230C\t2311
2313\t2319
231C\t231F
2320\t2321
2322\t2328
232B\t237B
237C\t237C
237D\t239A
239B\t23B3
23B4\t23DB
23DC\t23E1
23E2\t23E8
23ED\t23EF
23F1\t23F2
23F4\t23FF
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
25F0\t25F7
25F8\t25FC
25FF\t25FF
2600\t2604
2607\t2608
260A\t260D
2610\t2613
2616\t261B
261D\t261D
261F\t263F
2641\t2641
2643\t2647
2654\t265F
2662\t2662
2666\t2666
266B\t266B
266E\t266E
2670\t267E
2680\t2692
2694\t269D
26A0\t26A0
26A2\t26A9
26AC\t26BC
26C0\t26C3
26E2\t26E2
26E4\t26E7
2700\t2704
2706\t2709
270C\t2727
2729\t273C
273E\t274B
274D\t274D
274F\t2752
2756\t2756
2758\t2767
2768\t2775
2780\t2793
2794\t2794
2798\t27AF
27B1\t27BE
27C0\t27C4
27C5\t27C6
27C7\t27E5
27EE\t27EF
27F0\t27FF
2800\t28FF
2900\t297F
2980\t2982
2983\t2984
2987\t2998
2999\t29D7
29D8\t29DB
29DC\t29FB
29FC\t29FD
29FE\t29FF
2A00\t2AFF
2B00\t2B1A
2B1D\t2B2F
2B30\t2B44
2B45\t2B46
2B47\t2B4C
2B4D\t2B4F
2B51\t2B54
2B5A\t2B73
2B76\t2B95
2B97\t2BFF
2C00\t2C5F
2C60\t2C7B
2C7C\t2C7D
2C7E\t2C7F
2C80\t2CE4
2CE5\t2CEA
2CEB\t2CEE
2CEF\t2CF1
2CF2\t2CF3
2CF9\t2CFC
2CFD\t2CFD
2CFE\t2CFF
2D00\t2D25
2D27\t2D2D
2D30\t2D67
2D6F\t2D7F
2D80\t2D96
2DA0\t2DA6
2DA8\t2DAE
2DB0\t2DB6
2DB8\t2DBE
2DC0\t2DC6
2DC8\t2DCE
2DD0\t2DD6
2DD8\t2DDE
2DE0\t2DFF
2E00\t2E01
2E02\t2E05
2E06\t2E08
2E09\t2E0D
2E0E\t2E16
2E17\t2E17
2E18\t2E19
2E1A\t2E1D
2E1E\t2E1F
2E20\t2E29
2E2A\t2E2E
2E2F\t2E2F
2E30\t2E39
2E3A\t2E3B
2E3C\t2E3F
2E40\t2E42
2E43\t2E4F
2E50\t2E51
2E52\t2E54
2E55\t2E5D
303F\t303F
4DC0\t4DFF
A4D0\tA4F7
A4F8\tA4FD
A4FE\tA4FF
A500\tA60B
A60C\tA60C
A60D\tA60F
A610\tA61F
A620\tA629
A62A\tA62B
A640\tA66D
A66E\tA66F
A670\tA672
A673\tA673
A674\tA67D
A67E\tA67F
A680\tA69B
A69C\tA69D
A69E\tA69F
A6A0\tA6E5
A6E6\tA6EF
A6F0\tA6F1
A6F2\tA6F7
A700\tA716
A717\tA71F
A720\tA721
A722\tA76F
A770\tA770
A771\tA787
A788\tA788
A789\tA78A
A78B\tA78E
A78F\tA78F
A790\tA7CA
A7D0\tA7D1
A7D3\tA7D3
A7D5\tA7D9
A7F2\tA7F4
A7F5\tA7F6
A7F7\tA7F7
A7F8\tA7F9
A7FA\tA7FA
A7FB\tA7FF
A800\tA801
A802\tA802
A803\tA805
A806\tA806
A807\tA80A
A80B\tA80B
A80C\tA822
A823\tA824
A825\tA826
A827\tA827
A828\tA82B
A82C\tA82C
A830\tA835
A836\tA837
A838\tA839
A840\tA873
A874\tA877
A880\tA881
A882\tA8B3
A8B4\tA8C3
A8C4\tA8C5
A8CE\tA8CF
A8D0\tA8D9
A8E0\tA8F1
A8F2\tA8F7
A8F8\tA8FA
A8FB\tA8FC
A8FD\tA8FE
A8FF\tA8FF
A900\tA909
A90A\tA925
A926\tA92D
A92E\tA92F
A930\tA946
A947\tA951
A952\tA953
A95F\tA95F
A980\tA982
A983\tA983
A984\tA9B2
A9B3\tA9B3
A9B4\tA9B5
A9B6\tA9B9
A9BA\tA9BB
A9BC\tA9BD
A9BE\tA9C0
A9C1\tA9CD
A9CF\tA9CF
A9D0\tA9D9
A9DE\tA9DF
A9E0\tA9E4
A9E5\tA9E6
A9E7\tA9EF
A9F0\tA9F9
A9FA\tA9FE
AA00\tAA28
AA29\tAA2E
AA2F\tAA30
AA31\tAA32
AA33\tAA34
AA35\tAA36
AA40\tAA42
AA43\tAA43
AA44\tAA4B
AA4C\tAA4D
AA50\tAA59
AA5C\tAA5F
AA60\tAA6F
AA70\tAA70
AA71\tAA76
AA77\tAA79
AA7A\tAA7D
AA7E\tAA7F
AA80\tAAAF
AAB0\tAAB1
AAB2\tAAB4
AAB5\tAAB6
AAB7\tAAB8
AAB9\tAABD
AABE\tAABF
AAC0\tAAC2
AADB\tAADC
AADD\tAADD
AADE\tAADF
AAE0\tAAEA
AAEB\tAAEB
AAEC\tAAED
AAEE\tAAEF
AAF0\tAAF1
AAF2\tAAF2
AAF3\tAAF4
AAF5\tAAF6
AB01\tAB06
AB09\tAB0E
AB11\tAB16
AB20\tAB26
AB28\tAB2E
AB30\tAB5A
AB5B\tAB5B
AB5C\tAB5F
AB60\tAB68
AB69\tAB69
AB6A\tAB6B
AB70\tABBF
ABC0\tABE2
ABE3\tABE4
ABE5\tABE5
ABE6\tABE7
ABE8\tABE8
ABE9\tABEA
ABEB\tABED
ABF0\tABF9
D7B0\tD7C6
D7CB\tD7FB
D800\tDB7F
DB80\tDBFF
DC00\tDFFF
FB00\tFB06
FB13\tFB17
FB1D\tFB1E
FB1F\tFB28
FB29\tFB29
FB2A\tFB36
FB38\tFB3C
FB3E\tFB3E
FB40\tFB41
FB43\tFB44
FB46\tFB4F
FB50\tFBB1
FBB2\tFBC2
FBD3\tFD3D
FD3E\tFD3F
FD40\tFD4F
FD50\tFD8F
FD92\tFDC7
FDCF\tFDCF
FDF0\tFDFB
FDFC\tFDFC
FDFD\tFDFF
FE20\tFE2F
FE70\tFE74
FE76\tFEFC
FEFF\tFEFF
FFF9\tFFFB
FFFC\tFFFC
10000\t1000B
1000D\t10026
10028\t1003A
1003C\t1003D
1003F\t1004D
10050\t1005D
10080\t100FA
10100\t10102
10107\t10133
10137\t1013F
10140\t10174
10175\t10178
10179\t10189
1018A\t1018B
1018C\t1018E
10190\t1019C
101A0\t101A0
101D0\t101FC
101FD\t101FD
10280\t1029C
102A0\t102D0
102E0\t102E0
102E1\t102FB
10300\t1031F
10320\t10323
1032D\t1032F
10330\t10340
10341\t10341
10342\t10349
1034A\t1034A
10350\t10375
10376\t1037A
10380\t1039D
1039F\t1039F
103A0\t103C3
103C8\t103CF
103D0\t103D0
103D1\t103D5
10400\t1044F
10450\t1047F
10480\t1049D
104A0\t104A9
104B0\t104D3
104D8\t104FB
10500\t10527
10530\t10563
1056F\t1056F
10570\t1057A
1057C\t1058A
1058C\t10592
10594\t10595
10597\t105A1
105A3\t105B1
105B3\t105B9
105BB\t105BC
10600\t10736
10740\t10755
10760\t10767
10780\t10785
10787\t107B0
107B2\t107BA
10800\t10805
10808\t10808
1080A\t10835
10837\t10838
1083C\t1083F
10840\t10855
10857\t10857
10858\t1085F
10860\t10876
10877\t10878
10879\t1087F
10880\t1089E
108A7\t108AF
108E0\t108F2
108F4\t108F5
108FB\t108FF
10900\t10915
10916\t1091B
1091F\t1091F
10920\t10939
1093F\t1093F
10980\t1099F
109A0\t109B7
109BC\t109BD
109BE\t109BF
109C0\t109CF
109D2\t109FF
10A00\t10A00
10A01\t10A03
10A05\t10A06
10A0C\t10A0F
10A10\t10A13
10A15\t10A17
10A19\t10A35
10A38\t10A3A
10A3F\t10A3F
10A40\t10A48
10A50\t10A58
10A60\t10A7C
10A7D\t10A7E
10A7F\t10A7F
10A80\t10A9C
10A9D\t10A9F
10AC0\t10AC7
10AC8\t10AC8
10AC9\t10AE4
10AE5\t10AE6
10AEB\t10AEF
10AF0\t10AF6
10B00\t10B35
10B39\t10B3F
10B40\t10B55
10B58\t10B5F
10B60\t10B72
10B78\t10B7F
10B80\t10B91
10B99\t10B9C
10BA9\t10BAF
10C00\t10C48
10C80\t10CB2
10CC0\t10CF2
10CFA\t10CFF
10D00\t10D23
10D24\t10D27
10D30\t10D39
10E60\t10E7E
10E80\t10EA9
10EAB\t10EAC
10EAD\t10EAD
10EB0\t10EB1
10F00\t10F1C
10F1D\t10F26
10F27\t10F27
10F30\t10F45
10F46\t10F50
10F51\t10F54
10F55\t10F59
10F70\t10F81
10F82\t10F85
10F86\t10F89
10FB0\t10FC4
10FC5\t10FCB
10FE0\t10FF6
11000\t11002
11003\t11037
11038\t11046
11047\t1104D
11052\t11065
11066\t1106F
11070\t11070
11071\t11072
11073\t11074
11075\t1107F
11080\t11081
11082\t11082
11083\t110AF
110B0\t110B2
110B3\t110B6
110B7\t110B8
110B9\t110BA
110BB\t110BC
110BD\t110BD
110BE\t110C1
110C2\t110CD
110D0\t110E8
110F0\t110F9
11100\t11102
11103\t11126
11127\t1112B
1112C\t1112C
1112D\t11134
11136\t1113F
11140\t11143
11144\t11144
11145\t11146
11147\t11147
11150\t11172
11173\t11173
11174\t11175
11176\t11176
11180\t11181
11182\t11182
11183\t111B2
111B3\t111B5
111B6\t111BE
111BF\t111C0
111C1\t111C4
111C5\t111C8
111C9\t111CC
111CD\t111CF
111D0\t111D9
111DA\t111DC
111DD\t111DF
111E1\t111F4
11200\t11211
11213\t1122B
1122C\t1122E
1122F\t11231
11232\t11233
11234\t11235
11236\t11237
11238\t1123D
1123E\t1123E
11280\t11286
11288\t11288
1128A\t1128D
1128F\t1129D
1129F\t112A8
112A9\t112A9
112B0\t112DE
112DF\t112DF
112E0\t112E2
112E3\t112EA
112F0\t112F9
11300\t11301
11302\t11303
11305\t1130C
1130F\t11310
11313\t11328
1132A\t11330
11332\t11333
11335\t11339
1133B\t1133C
1133D\t1133D
1133E\t1133F
11340\t11340
11341\t11344
11347\t11348
1134B\t1134D
11350\t11357
1135D\t11361
11362\t11363
11366\t1136C
11370\t11374
11400\t11434
11435\t11437
11438\t1143F
11440\t11441
11442\t11444
11445\t11446
11447\t1144A
1144B\t1144F
11450\t11459
1145A\t1145B
1145D\t1145E
1145F\t11461
11480\t114AF
114B0\t114B2
114B3\t114B8
114B9\t114BA
114BB\t114BE
114BF\t114C0
114C1\t114C1
114C2\t114C3
114C4\t114C5
114C6\t114C7
114D0\t114D9
11580\t115AE
115AF\t115B1
115B2\t115B5
115B8\t115BB
115BC\t115BD
115BE\t115BE
115BF\t115C0
115C1\t115D7
115D8\t115DB
115DC\t115DD
11600\t1162F
11630\t11632
11633\t1163A
1163B\t1163C
1163D\t1163E
1163F\t11640
11641\t11643
11644\t11644
11650\t11659
11660\t1166C
11680\t116AA
116AB\t116AD
116AE\t116AF
116B0\t116B5
116B6\t116B9
116C0\t116C9
11700\t1171A
1171D\t1171F
11720\t11721
11722\t11725
11726\t11726
11727\t1172B
11730\t11739
1173A\t1173B
1173C\t1173E
1173F\t1173F
11740\t11746
11800\t1182B
1182C\t1182E
1182F\t11837
11838\t11838
11839\t1183A
1183B\t1183B
118A0\t118DF
118E0\t118E9
118EA\t118F2
118FF\t118FF
11900\t11906
11909\t11909
1190C\t11913
11915\t11916
11918\t1192F
11930\t11935
11937\t11938
1193B\t1193C
1193D\t11943
11944\t11946
11950\t11959
119A0\t119A7
119AA\t119D0
119D1\t119D3
119D4\t119D7
119DA\t119DB
119DC\t119DF
119E0\t11A00
11A01\t11A0A
11A0B\t11A32
11A33\t11A38
11A39\t11A3A
11A3B\t11A3E
11A3F\t11A46
11A47\t11A50
11A51\t11A56
11A57\t11A58
11A59\t11A5B
11A5C\t11A89
11A8A\t11A96
11A97\t11A97
11A98\t11A99
11A9A\t11A9C
11A9D\t11A9D
11A9E\t11AA2
11AB0\t11ABF
11AC0\t11AF8
11C00\t11C08
11C0A\t11C2E
11C2F\t11C2F
11C30\t11C36
11C38\t11C3D
11C3E\t11C40
11C41\t11C45
11C50\t11C59
11C5A\t11C6C
11C70\t11C71
11C72\t11C8F
11C92\t11CA7
11CA9\t11CA9
11CAA\t11CB0
11CB1\t11CB1
11CB2\t11CB3
11CB4\t11CB4
11CB5\t11CB6
11D00\t11D06
11D08\t11D09
11D0B\t11D30
11D31\t11D36
11D3A\t11D3A
11D3C\t11D3D
11D3F\t11D45
11D46\t11D47
11D50\t11D59
11D60\t11D65
11D67\t11D68
11D6A\t11D89
11D8A\t11D8E
11D90\t11D91
11D93\t11D94
11D95\t11D98
11DA0\t11DA9
11EE0\t11EF2
11EF3\t11EF4
11EF5\t11EF6
11EF7\t11EF8
11FB0\t11FB0
11FC0\t11FD4
11FD5\t11FDC
11FDD\t11FE0
11FE1\t11FF1
11FFF\t11FFF
12000\t12399
12400\t1246E
12470\t12474
12480\t12543
12F90\t12FF0
12FF1\t12FF2
13000\t1342E
13430\t13438
14400\t14646
16800\t16A38
16A40\t16A5E
16A60\t16A69
16A6E\t16A6F
16A70\t16ABE
16AC0\t16AC9
16AD0\t16AED
16AF0\t16AF4
16AF5\t16AF5
16B00\t16B2F
16B30\t16B36
16B37\t16B3B
16B3C\t16B3F
16B40\t16B43
16B44\t16B45
16B50\t16B59
16B5B\t16B61
16B63\t16B77
16B7D\t16B8F
16E40\t16E7F
16E80\t16E96
16E97\t16E9A
16F00\t16F4A
16F4F\t16F50
16F51\t16F87
16F8F\t16F92
16F93\t16F9F
1BC00\t1BC6A
1BC70\t1BC7C
1BC80\t1BC88
1BC90\t1BC99
1BC9C\t1BC9C
1BC9D\t1BC9E
1BC9F\t1BC9F
1BCA0\t1BCA3
1CF00\t1CF2D
1CF30\t1CF46
1CF50\t1CFC3
1D000\t1D0F5
1D100\t1D126
1D129\t1D164
1D165\t1D166
1D167\t1D169
1D16A\t1D16C
1D16D\t1D172
1D173\t1D17A
1D17B\t1D182
1D183\t1D184
1D185\t1D18B
1D18C\t1D1A9
1D1AA\t1D1AD
1D1AE\t1D1EA
1D200\t1D241
1D242\t1D244
1D245\t1D245
1D2E0\t1D2F3
1D300\t1D356
1D360\t1D378
1D400\t1D454
1D456\t1D49C
1D49E\t1D49F
1D4A2\t1D4A2
1D4A5\t1D4A6
1D4A9\t1D4AC
1D4AE\t1D4B9
1D4BB\t1D4BB
1D4BD\t1D4C3
1D4C5\t1D505
1D507\t1D50A
1D50D\t1D514
1D516\t1D51C
1D51E\t1D539
1D53B\t1D53E
1D540\t1D544
1D546\t1D546
1D54A\t1D550
1D552\t1D6A5
1D6A8\t1D6C0
1D6C1\t1D6C1
1D6C2\t1D6DA
1D6DB\t1D6DB
1D6DC\t1D6FA
1D6FB\t1D6FB
1D6FC\t1D714
1D715\t1D715
1D716\t1D734
1D735\t1D735
1D736\t1D74E
1D74F\t1D74F
1D750\t1D76E
1D76F\t1D76F
1D770\t1D788
1D789\t1D789
1D78A\t1D7A8
1D7A9\t1D7A9
1D7AA\t1D7C2
1D7C3\t1D7C3
1D7C4\t1D7CB
1D7CE\t1D7FF
1D800\t1D9FF
1DA00\t1DA36
1DA37\t1DA3A
1DA3B\t1DA6C
1DA6D\t1DA74
1DA75\t1DA75
1DA76\t1DA83
1DA84\t1DA84
1DA85\t1DA86
1DA87\t1DA8B
1DA9B\t1DA9F
1DAA1\t1DAAF
1DF00\t1DF09
1DF0A\t1DF0A
1DF0B\t1DF1E
1E000\t1E006
1E008\t1E018
1E01B\t1E021
1E023\t1E024
1E026\t1E02A
1E100\t1E12C
1E130\t1E136
1E137\t1E13D
1E140\t1E149
1E14E\t1E14F
1E290\t1E2AD
1E2AE\t1E2AE
1E2C0\t1E2EB
1E2EC\t1E2EF
1E2F0\t1E2F9
1E2FF\t1E2FF
1E7E0\t1E7E6
1E7E8\t1E7EB
1E7ED\t1E7EE
1E7F0\t1E7FE
1E800\t1E8C4
1E8C7\t1E8CF
1E8D0\t1E8D6
1E900\t1E943
1E944\t1E94A
1E94B\t1E94B
1E950\t1E959
1E95E\t1E95F
1EC71\t1ECAB
1ECAC\t1ECAC
1ECAD\t1ECAF
1ECB0\t1ECB0
1ECB1\t1ECB4
1ED01\t1ED2D
1ED2E\t1ED2E
1ED2F\t1ED3D
1EE00\t1EE03
1EE05\t1EE1F
1EE21\t1EE22
1EE24\t1EE27
1EE29\t1EE32
1EE34\t1EE37
1EE39\t1EE4B
1EE4D\t1EE4F
1EE51\t1EE52
1EE54\t1EE5F
1EE61\t1EE62
1EE64\t1EE64
1EE67\t1EE6A
1EE6C\t1EE72
1EE74\t1EE77
1EE79\t1EE7C
1EE7E\t1EE7E
1EE80\t1EE89
1EE8B\t1EE9B
1EEA1\t1EEA3
1EEA5\t1EEA9
1EEAB\t1EEBB
1EEF0\t1EEF1
1F000\t1F003
1F005\t1F02B
1F030\t1F093
1F0A0\t1F0AE
1F0B1\t1F0BF
1F0C1\t1F0CE
1F0D1\t1F0F5
1F10B\t1F10C
1F10D\t1F10F
1F12E\t1F12F
1F16A\t1F16F
1F1AD\t1F1AD
1F1E6\t1F1FF
1F321\t1F32C
1F336\t1F336
1F37D\t1F37D
1F394\t1F39F
1F3CB\t1F3CE
1F3D4\t1F3DF
1F3F1\t1F3F3
1F3F5\t1F3F7
1F43F\t1F43F
1F441\t1F441
1F4FD\t1F4FE
1F53E\t1F54A
1F54F\t1F54F
1F568\t1F579
1F57B\t1F594
1F597\t1F5A3
1F5A5\t1F5FA
1F650\t1F67F
1F6C6\t1F6CB
1F6CD\t1F6CF
1F6D3\t1F6D4
1F6E0\t1F6EA
1F6F0\t1F6F3
1F700\t1F773
1F780\t1F7D8
1F800\t1F80B
1F810\t1F847
1F850\t1F859
1F860\t1F887
1F890\t1F8AD
1F8B0\t1F8B1
1F900\t1F90B
1F93B\t1F93B
1F946\t1F946
1FA00\t1FA53
1FA60\t1FA6D
1FB00\t1FB92
1FB94\t1FBCA
1FBF0\t1FBF9
E0001\tE0001
E0020\tE007F
END
}

sub InEastAsianWide {
    return <<"END";
1100\t115F
231A\t231B
2329\t232A
23E9\t23EC
23F0\t23F0
23F3\t23F3
25FD\t25FE
2614\t2615
2648\t2653
267F\t267F
2693\t2693
26A1\t26A1
26AA\t26AB
26BD\t26BE
26C4\t26C5
26CE\t26CE
26D4\t26D4
26EA\t26EA
26F2\t26F3
26F5\t26F5
26FA\t26FA
26FD\t26FD
2705\t2705
270A\t270B
2728\t2728
274C\t274C
274E\t274E
2753\t2755
2757\t2757
2795\t2797
27B0\t27B0
27BF\t27BF
2B1B\t2B1C
2B50\t2B50
2B55\t2B55
2E80\t2E99
2E9B\t2EF3
2F00\t2FD5
2FF0\t2FFB
3001\t3003
3004\t3011
3012\t3013
3014\t301D
301E\t301F
3020\t3020
3021\t3029
302A\t302D
302E\t302F
3030\t3030
3031\t3035
3036\t3037
3038\t303A
303B\t303E
3041\t3096
3099\t309A
309B\t309C
309D\t309E
309F\t30A0
30A1\t30FA
30FB\t30FB
30FC\t30FE
30FF\t30FF
3105\t312F
3131\t318E
3190\t3191
3192\t3195
3196\t319F
31A0\t31BF
31C0\t31E3
31F0\t31FF
3200\t321E
3220\t3229
322A\t3247
3250\t3250
3251\t325F
3260\t327F
3280\t3289
328A\t32B0
32B1\t32BF
32C0\t32FF
3300\t33FF
3400\t4DBF
4E00\t9FFF
A000\tA014
A015\tA015
A016\tA48C
A490\tA4C6
A960\tA97C
AC00\tD7A3
F900\tFA6D
FA6E\tFA6F
FA70\tFAD9
FADA\tFAFF
FE10\tFE16
FE17\tFE19
FE30\tFE30
FE31\tFE32
FE33\tFE34
FE35\tFE44
FE45\tFE46
FE47\tFE48
FE49\tFE4C
FE4D\tFE4F
FE50\tFE52
FE54\tFE57
FE58\tFE5E
FE5F\tFE61
FE62\tFE63
FE64\tFE66
FE68\tFE69
FE6A\tFE6B
16FE0\t16FE1
16FE2\t16FE4
16FF0\t16FF1
17000\t187F7
18800\t18AFF
18B00\t18CD5
18D00\t18D08
1AFF0\t1AFF3
1AFF5\t1AFFB
1AFFD\t1AFFE
1B000\t1B0FF
1B100\t1B122
1B150\t1B152
1B164\t1B167
1B170\t1B2FB
1F004\t1F004
1F0CF\t1F0CF
1F18E\t1F18E
1F191\t1F19A
1F200\t1F202
1F210\t1F23B
1F240\t1F248
1F250\t1F251
1F260\t1F265
1F300\t1F320
1F32D\t1F335
1F337\t1F37C
1F37E\t1F393
1F3A0\t1F3CA
1F3CF\t1F3D3
1F3E0\t1F3F0
1F3F4\t1F3F4
1F3F8\t1F3FA
1F3FB\t1F3FF
1F400\t1F43E
1F440\t1F440
1F442\t1F4FC
1F4FF\t1F53D
1F54B\t1F54E
1F550\t1F567
1F57A\t1F57A
1F595\t1F596
1F5A4\t1F5A4
1F5FB\t1F5FF
1F600\t1F64F
1F680\t1F6C5
1F6CC\t1F6CC
1F6D0\t1F6D2
1F6D5\t1F6D7
1F6DD\t1F6DF
1F6EB\t1F6EC
1F6F4\t1F6FC
1F7E0\t1F7EB
1F7F0\t1F7F0
1F90C\t1F93A
1F93C\t1F945
1F947\t1F9FF
1FA70\t1FA74
1FA78\t1FA7C
1FA80\t1FA86
1FA90\t1FAAC
1FAB0\t1FABA
1FAC0\t1FAC5
1FAD0\t1FAD9
1FAE0\t1FAE7
1FAF0\t1FAF6
20000\t2A6DF
2A6E0\t2A6FF
2A700\t2B738
2B739\t2B73F
2B740\t2B81D
2B81E\t2B81F
2B820\t2CEA1
2CEA2\t2CEAF
2CEB0\t2EBE0
2EBE1\t2F7FF
2F800\t2FA1D
2FA1E\t2FA1F
2FA20\t2FFFD
30000\t3134A
3134B\t3FFFD
END
}

### END ###

1;

__END__

=encoding UTF-8

=head1 NAME

Unicode::EastAsianWidth - East Asian Width properties

=head1 SYNOPSIS

    use Unicode::EastAsianWidth;

    $_ = chr(0x2010); # HYPHEN, an ambiguous-width character

    /\p{InEastAsianAmbiguous}/; # True
    /\p{InFullwidth}/;          # False

To mark ambiguous-width characters as InFullwidth:

    BEGIN { $Unicode::EastAsianWidth::EastAsian = 1; }
    use Unicode::EastAsianWidth;

    $_ = chr(0x2010); # HYPHEN, an ambiguous-width character
    /\p{InFullwidth}/;          # True

=head1 DESCRIPTION

This module provide user-defined Unicode properties that deal with
width status of East Asian characters, as specified in
L<http://www.unicode.org/unicode/reports/tr11/>.

It exports the following functions to the caller's scope, to be
used by Perl's Unicode matching system: C<InEastAsianFullwidth>,
C<InEastAsianHalfwidth>, C<InEastAsianAmbiguous>, C<InEastAsianNarrow>
C<InEastAsianWide>, C<InEastAsianNeutral>.

In accord to TR11 cited above, two additional context-sensitive properties
are exported: C<InFullwidth> (union of C<Fullwidth> and C<Wide>) and
C<InHalfwidth> (union of C<Halfwidth>, C<Narrow> and C<Neutral>).

I<Ambiguous> characters are treated by default as part of
C<InHalfwidth>, but you can modify this behaviour by assigning
a true value to C<$Unicode::EastAsianWidth::EastAsian> at compile time
within a C<BEGIN> block before loading this module:

    BEGIN { $Unicode::EastAsianWidth::EastAsian = 1; }
    use Unicode::EastAsianWidth;

Setting C<$Unicode::EastAsianWidth::EastAsian> at run-time used to
work on Perl versions between 5.8 and 5.14 due to an implementation
detail, but it will no longer work on Perl 5.16 and later versions,
and hence is not recommended.

=head1 SEE ALSO

L<perlunicode>,
L<http://www.unicode.org/unicode/reports/tr11/>

=head1 AUTHORS

Audrey Tang E<lt>cpan@audreyt.orgE<gt>

=head1 LICENSE

This work is under the B<CC0 1.0 Universal> license.

To the extent possible under law, 唐鳳 has waived all copyright and related
or neighboring rights to Unicode-EastAsianWidth.

This work is published from Taiwan.

L<http://creativecommons.org/publicdomain/zero/1.0>

=cut
