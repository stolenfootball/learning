#!/usr/bin/perl

use warnings;
use utf8;
binmode STDOUT, ":encoding(UTF-8)";

$filename = 'ieee_mac-addr_block-large.txt';
open($fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file: $filename --> $!";
@contents = <$fh>;
close $fh;

$active = 7;
$data = "";
@datasets = '';

foreach $row(@contents) {
    if($active > 0 && $active < 7) {
        $data = $data . $row;
    }
    if($active == 6) {
        push @datasets, $data;
        $data = "";
    }
    if($row !~ m/\S/) {
        $active = 1;
    }
    $active++; 
};

foreach $set(@datasets) {
    @data = split ("\n", $set);
    $line1 = $data[0];
    $line3 = $data[2];
    $line4 = $data[3];
    $line5 = $data[4];

    # Line 1 ###
    @line1a = split(" ", $line1);
    $hex = $line1a[0];
    $hex =~ s/-//g;
    $compindex = $#line1a;
    @compi = @line1a[2 .. $compindex];
    $company = join(' ', @compi);

    # Line 3 ###
    $line3 =~ s/^\s+//;
    chomp $line3;
    $address = $line3;

    # Line 4 ###
    $line4 =~ s/^\s+//;
    chomp $line4;
    $city = $line4;

    # Line 5 ###
    $line5 =~ s/^\s+//;
    chomp $line5;
    $country = $line5;

#    $template = "INSERT INTO MAC_Blocks (AddrBlock, Company, Street, City, Country) VALUES (";

#    $result = $template . "'" . $hex . "', '" . $company . "', '" . $address . "', '" . $city . "', '" . $country . "');";
#    print "$result\n";

    $final = $hex . "	" . $company;

    print "$final\n";
};





















