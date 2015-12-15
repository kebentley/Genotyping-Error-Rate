#!/usr/bin/perl
use warnings;
use strict;

#####WRITTEN BY KERIN BENTLEY#####
#This script identifies differences between data files to help you calculate genotyping error rate (GER) based on Pompanon et al., (2005)
#Make sure your input files are unix-LF endings and are tab-delimited textfiles.
#This script was written for Bentley and Mauricio (In Prep)
#In input file, KZ## are the names of the loci
#In input file, column one is the individual names

#GENERAL USAGE: perl IDGenotypicDifferencesForErrorRate.pl Input1.txt Input2.txt Outfile.txt

#open datafile1 and put it into hash1 with individual names as the key and data as value.
open my $data1, "<", $ARGV[0] || die "Can't open Dataset 1!!";

my %dataset1;
my @line1;
while(<$data1>){
	chomp;
	my @line1 = split /\s+/; #split the line by one or more whitespace characters
	my $indname1 = shift(@line1); #returns the first entry in the array.
	my $genotypes1 = join("\t", @line1); #puts the rest of the array into a single string.
	$dataset1{$indname1} = $genotypes1; #create hash with name as the key, data as value.
}

open my $data2, "<", $ARGV[1] || die "Can't open Dataset #2!";
open my $outfile, ">", $ARGV[2] || die "Can't open output file!";

my %dataset2;
my @line2;

#put the 2nd dataset into a second hash then ask if the key from hash1
#exists in hash1, and compare the values for those keys. If those values match
#then print the line of data. If they don't match, say so. If a key from dataset1
#can't be found in dataset2 at all, then say so.
while(<$data2>){
	chomp;
	my @line2 = split /\s+/;
	my $indname2 = shift(@line2);
	my $genotypes2 =  join("\t", @line2);  
	$dataset2{$indname2} = $genotypes2; 
}
close $data2;
#if the value from hash2 matches the
#value of the same individual in hash1
#if values for both hashes for the same individual dont match, 
#then tell me there is an error on this line for this individual.
	for (keys %dataset2){
		unless(exists $dataset1{$_}){
			print $outfile "Ignore $_ as is not found in the GER dataset.\n";
			next;
		}
		if ($dataset1{$_} eq $dataset2{$_}){  								
			print $outfile "This individual matches between datasets: $_\n"; #print the line with key & value
		}else{ 
			if (exists $dataset1{$_} && exists $dataset2{$_}){
			
			my @discrepancylist;
			my @newarray1 =  split("\t", $dataset1{$_});
			my @newarray2 =  split("\t", $dataset2{$_});
		if (scalar(@newarray1) != 30){
			print $outfile "Wrong scalar in $ARGV[0] $_\n";
			}
		if (scalar(@newarray2) != 30){
			print $outfile "Wrong scalar in $ARGV[1] $_\n";
			}
		
			if ($newarray1[0] != $newarray2[0]){
				push(@discrepancylist, "KZ06A1 $newarray1[0]\t");
				}
			if ($newarray1[1] != $newarray2[1]){
				push(@discrepancylist, "KZ06A2 $newarray1[1]\t");
				}
			if ($newarray1[2] != $newarray2[2]){
				push(@discrepancylist, "KZ12A1 $newarray1[2]\t");
				}
			if ($newarray1[3] != $newarray2[3]){
				push(@discrepancylist, "KZ12A2 $newarray1[3]\t");
				}
			if ($newarray1[4] != $newarray2[4]){
				push(@discrepancylist, "KZ31A1 $newarray1[4]\t");
				}
			if ($newarray1[5] != $newarray2[5]){
				push(@discrepancylist, "KZ31A2 $newarray1[5]\t");
				}
			if ($newarray1[6] != $newarray2[6]){
				push(@discrepancylist, "KZ35A1 $newarray1[6]\t");
				}
			if ($newarray1[7] != $newarray2[7]){
				push(@discrepancylist, "KZ35A2 $newarray1[7]\t");
				}
			if ($newarray1[8] != $newarray2[8]){
				push(@discrepancylist, "KZ37A1 $newarray1[8]\t");
				}
			if ($newarray1[9] != $newarray2[9]){
				push(@discrepancylist, "KZ37A2 $newarray1[9]\t");
				}
			if ($newarray1[10] != $newarray2[10]){
				push(@discrepancylist, "KZ42A1 $newarray1[10]\t");
				}
			if ($newarray1[11] != $newarray2[11]){
				push(@discrepancylist, "KZ42A2 $newarray1[11]\t");
				}
			if ($newarray1[12] != $newarray2[12]){
				push(@discrepancylist, "KZ46A1 $newarray1[12]\t");
				}
			if ($newarray1[13] ne $newarray2[13]){
				push(@discrepancylist, "KZ46A2 $newarray1[13]\t");
				}
			if ($newarray1[14] ne $newarray2[14]){
				push(@discrepancylist, "KZ50A1 $newarray1[14]\t");
				}
			if ($newarray1[15] ne $newarray2[15]){
				push(@discrepancylist, "KZ50A2 $newarray1[15]\t");
				}
			if ($newarray1[16] ne $newarray2[16]){
				push(@discrepancylist, "KZ56A1 $newarray1[16]\t");
				}
			if ($newarray1[17] ne $newarray2[17]){
				push(@discrepancylist, "KZ56A2 $newarray1[17]\t");
				}				
			if ($newarray1[18] ne $newarray2[18]){
				push(@discrepancylist, "KZ57A1 $newarray1[18]\t");
				}				
			if ($newarray1[19] ne $newarray2[19]){
				push(@discrepancylist, "KZ57A2 $newarray1[19]\t");
				}
			if ($newarray1[20] ne $newarray2[20]){
				push(@discrepancylist, "KZ68A1 $newarray1[20]\t");
				}
			if ($newarray1[21] ne $newarray2[21]){
				push(@discrepancylist, "KZ68A2 $newarray1[21]\t");
				}
			if ($newarray1[22] ne $newarray2[22]){
				push(@discrepancylist, "KZ73A1 $newarray1[22]\t");
				}
			if ($newarray1[23] ne $newarray2[23]){
				push(@discrepancylist, "KZ73A2 $newarray1[23]\t");
				}
			if ($newarray1[24] ne $newarray2[24]){
				push(@discrepancylist, "KZ75A1 $newarray1[24]\t");
				}
			if ($newarray1[25] ne $newarray2[25]){
				push(@discrepancylist, "KZ75A2 $newarray1[25]\t");
				}
			if ($newarray1[26] ne $newarray2[26]){
				push(@discrepancylist, "KZ78A1 $newarray1[26]\t");
				}
			if ($newarray1[27] ne $newarray2[27]){
				push(@discrepancylist, "KZ78A2 $newarray1[27]\t");
				}
			if ($newarray1[28] ne $newarray2[28]){
				push(@discrepancylist, "KZ79A1 $newarray1[28]\t");
				}
			if ($newarray1[29] ne $newarray2[29]){
				push(@discrepancylist, "KZ79A2 $newarray1[29]\t");
				}																																																																																																											
			print $outfile "$_ has a genotyping error: @discrepancylist", "\n";	
		}
		}
}		
close $data1;
close $outfile;
exit;
