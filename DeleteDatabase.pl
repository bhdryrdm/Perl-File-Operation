#!/usr/bin/perl
use strict; 
use File::Path 'rmtree';

my $databaseName = $ARGV[0];
my $databaseDirectoryPath = '';
my $forceDirectory = $ARGV[1];

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
         $databaseDirectoryPath = @linearray[$i+1];
       } 
  }
}
close $fileHandle;
=for -----------------------------------------------------------------  
=cut

if (-e $databaseDirectoryPath and -d $databaseDirectoryPath) # Is directory exist check ?
{	
	if($forceDirectory eq "--force") # --force parameter check
	{
		rmtree( $databaseDirectoryPath ) or die "Couldn't remove $databaseDirectoryPath directory, $!";
		print "Directory(Database) deleted successfully\n";	
	}
	else 
	{
		if(isDirectoryEmpty($databaseDirectoryPath)) # is direcetory  empty ?
		{
			# Directory empty and delete
			rmdir( $databaseDirectoryPath ) or die "Couldn't remove $databaseDirectoryPath directory, $!";
			print "Directory(Database) deleted successfully\n";	
		}
		else
		{
			# Directory not empty and so ask the user
			print "\aSorry, this operation not available.\nDirectory not empty!\nPlease Enter 'Y' for deleting this directory\n";
			my $deleteControlCharacter = <STDIN>;
			chomp $deleteControlCharacter;
			if($deleteControlCharacter eq "Y" || $deleteControlCharacter eq "y")
			{
				rmtree( $databaseDirectoryPath ) or die "Couldn't remove $databaseDirectoryPath directory, $!";
				print "Directory(Database) deleted successfully\n";
			}
			else
			{
				print "Directory(Database) was not deleted \n";
			}
		}
	}
}
else # Directory absent
{
	print "Directory does not exist \n";	
}


# Is Directory empty method
sub isDirectoryEmpty 
{
    my $dirname = shift;
    opendir(my $dh, $dirname) or die "Not a directory";
    return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}