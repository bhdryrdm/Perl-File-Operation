#!/usr/bin/perl
use strict; 
use File::Path 'rmtree';

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

unlink $tablePath; # delete file

if (-e $tablePath) # Is File exist ?  
{		
	print "File(Table) was not deleted \n";	
}
else # If file does not exist , file was deleted successfully
{
	print "File(Table) was deleted successfully \n";	
}
