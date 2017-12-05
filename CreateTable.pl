#!/usr/bin/perl
use strict; 

my $databaseName = $ARGV[0];
my $tableName = $ARGV[1];

=for ----------------- Find path from $ARGV[1] so $tableName -------------- 
=cut
my $databasePathList = './Paths.txt';
my $tablePath;
open my $fileHandle, "<", "$databasePathList" or die "Can't open '$databasePathList'\n";

while (my $line = <$fileHandle>) 
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
close $fileHandle;
=for -----------------------------------------------------------------  
=cut
 
open my $tableHandle, ">>", "$tablePath" or die "Can't open '$tablePath'\n";

if($ARGV[2] eq "--columns" and $ARGV[3] eq "--pk") # Argument control
{
  print $tableHandle "PK_$ARGV[4];"; # PK_Column
  foreach my $argnum (5 .. $#ARGV) 
  {
    print $tableHandle "$ARGV[$argnum];"; # Add ColumnName for this Table(File)
  }
  print $tableHandle "\n";
  print "File(Table) was created successfully \n";
}

close $tableHandle;

