#!/usr/bin/perl

use 5.010;
use strict;
my $databaseName = $ARGV[0];
my $tableName = $ARGV[1];

=for ----------------- Find path from $ARGV[1] so $tableName -------------- 
=cut
my $databasePathList = './Paths.txt';
my $databasePath;
open my $fileHandle, "<", "$databasePathList" or die "Can't open '$databasePathList'\n";

while (my $line = <$fileHandle>) 
{   
  chomp $line;
  my @linearray = split(",", $line);
  
  for (my $i=0; $i < @linearray.length; $i++) 
  {
       if(@linearray[$i] eq $databaseName)
       {
         $databasePath = @linearray[$i+1];
       } 
  }
}
close $fileHandle;
=for -----------------------------------------------------------------  
=cut
opendir my $dir, "$databasePath" or die "Cannot open directory: $!";
  my @files = readdir $dir;
  my $tableExist = "false";
    for (my $i=0; $i < @files.length; $i++) 
    {
         if(@files[$i] eq "$tableName.txt")
         {
           $tableExist = "true";
         } 
    }
    if($tableExist eq "true")
    {
      print "Table was exist.\nIts path : $databasePath\\$tableName.txt \n";
    }
    else
    {
      print "Table does not exist!";
    }
closedir $dir;