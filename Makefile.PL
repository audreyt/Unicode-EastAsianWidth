#!/usr/bin/perl
# $File: //member/autrijus/Unicode-EastAsianWidth/Makefile.PL $ $Author: autrijus $
# $Revision: #4 $ $Change: 8322 $ $DateTime: 2003/10/02 23:59:50 $

use 5.006;
use ExtUtils::MakeMaker;

_build_pm();

WriteMakefile(
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'East Asian Width properties',
    NAME		=> 'Unicode::EastAsianWidth',
    VERSION_FROM	=> 'lib/Unicode/EastAsianWidth.pm', 
    DISTNAME		=> 'Unicode-EastAsianWidth',
);

sub _build_pm {
    my $file;
    foreach (@INC) {
	$file = "$_/unicore/EastAsianWidth.txt";
	last if -e $file;
    }

    unless (-e $file) {
	warn "Cannot find unicore/EastAsanWidth.txt, using default (v4.0.0)\n";
	return;
    }

    unless (open EAW, $file) {
	warn "Cannot read $file, falling back to default (v4.0.0)\n";
	return;
    }

    my %Map = (
	N	=> 'InEastAsianNeutral',
	A	=> 'InEastAsianAmbiguous',
	H	=> 'InEastAsianHalfwidth',
	W	=> 'InEastAsianWide',
	F	=> 'InEastAsianFullwidth',
	Na	=> 'InEastAsianNarrow',
    );

    my %categ;
    my $begin;
    my ($l1, $l2) = (0, 0);

    while (<EAW>) {
	next unless /^([0-9A-F]+);(\S+)/;
	if ((hex($l1) + 1) != hex($1) or $l2 ne $2) {
	    push @{$categ{$l2}}, "$begin\\t$l1\n" if $begin;
	    $begin = $1;
	}
	($l1, $l2) = ($1, $2);
    }

    my $out;
    unless (open PM, 'lib/Unicode/EastAsianWidth.pm') {
	warn "Cannot read module ($!), falling back to default (v4.0.0)\n";
	return;
    }

    while (<PM>) { $out .= $_;    last if /^### BEGIN ###$/ }

    $out .= "our \@EXPORT = qw(\n" . join(
	"\n", values %Map, qw(InFullwidth InHalfwidth)
    ) . "\n);\n\n";

    foreach (sort keys %categ) {
	$out .= "sub $Map{$_} {\n    return <<END;\n".
	        join('', @{$categ{$_}}).
	        "END\n}\n";
    }

    while (<PM>) { $out .= $_ and last if /^### END ###$/ }
    while (<PM>) { $out .= $_ }

    close PM;

    chmod 0644, 'lib/Unicode/EastAsianWidth.pm';
    unless (open PM, '>', 'lib/Unicode/EastAsianWidth.pm') {
	warn "Cannot write to module ($!), falling back to default (v4.0.0)\n";
	return;
    }

    print PM $out;
    close PM;
}
