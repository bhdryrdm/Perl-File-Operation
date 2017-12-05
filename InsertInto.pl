#!/usr/bin/perl

use 5.010;
use strict;

my $databaseName = $ARGV[0];
my $tableName = $ARGV[1];

=for ----------------- Find path from $ARGV[1] so $tableName -------------- 
=cutmy $databasePathList = './Paths.txt';
my $tablePath;
open my $pathFileHandle, "<", "$databasePathList" or die "Can't open '$databasePathList'\n";
while (my $line = <$pathFileHandle>) 
{   
  chomp $line;
  my @linearray = split(",", $line);
  
  for (my $i=0; $i < @linearray.length; $i++) 
  {
       if(@linearray[$i] eq $databaseName)
       {
         $tablePath = @linearray[$i+1] . "\\$tableName.txt";
       } 
  }
}
close $pathFileHandle;
=for -----------------------------------------------------------------  
=cut
my $lineCount;
open my $fileHandle, "<", "$tablePath" or die "Can't open '$tablePath'\n";

while (<$fileHandle>) 
{   
  $lineCount++;
}
close $fileHandle;
# Record added in tale
open my $tableHandle, ">>", "$tablePath" or die "Can't open '$tablePath'\n";  print $tableHandle "$lineCount;"; # Line count for PK value  foreach my $argnum (3 .. $#ARGV) 
  { 
    if($argnum % 2 == 0) # is argnum is even its a column name
    {
      next;
    }
    print $tableHandle "$ARGV[$argnum];"; # add value from $ARGV[$argnum]; 
  }
  print $tableHandle "\n"; # new line

  print "Record was added successfully";

close $tableHandle;