#!/usr/bin/perl

$contents = `curl -s "http://www.thepaperwall.com/rss.category.php?feed=industrial"`;

@lines = split ' ', $contents;

foreach $line(@lines) {
    if( $line =~ m/href/ ) {
        $line =~ s/href=//;
        $line =~ s/>&#60;img//;
        $newcontents = `curl -s $line`;
        @newlines = split ' ', $newcontents;
        foreach $newline(@newlines) {
            if( $newline =~ m/src="\/wallpapers/ ) {
                $newline =~ s/src="//;
                $site = "\"http://www.thepaperwall.com";
                $final = $site . $newline;
                `wget -q $final -P/home/perditus/.config/variety/Downloaded/Custom`;
            }
        };
    }
};














