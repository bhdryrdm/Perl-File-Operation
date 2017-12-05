#!/usr/bin/perl
use strict; 
use warnings;

my $dir = $ARGV[0];

if (-e $dir and -d $dir) # is file exist check ?  
{	
	 print "Directory(Database) is already exist \n";	
}
else 
{
	mkdir( $dir ) or die "Couldn't create $dir directory(Database), $!";
	print "Directory(Database) created successfully\n";
}