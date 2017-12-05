#!/usr/bin/perl
use strict; 
use warnings;

my $path = $ARGV[0];
my $databaseName = $ARGV[1];

my $pathFolder = './Paths.txt';
open my $fileHandle, ">>", "$pathFolder" or die "Can't open '$pathFolder'\n";
if($path ne "" and $databaseName ne "")
{
  print $fileHandle "$databaseName,$path";
  print "Path was added successfully";
}
else
{
  print "Path or databasename must not empty";
}

close $fileHandle;