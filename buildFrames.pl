#!/usr/bin/perl
use Math::Trig;
use strict;

my $cnt=0;
my $input_file = shift;
system("balls -d2 <$input_file >$input_file.temp");

foreach my$i(0 .. 35)
	{
	open(O,">$input_file.ball.$i.r3d");
	open(M,"<$input_file.temp");
	while (<M>)
		{
		chomp;
		if ($_ eq '*')
			{
			$cnt++;
			}
		if($cnt == 3)
			{
			$cnt = 0;
			print O "$_\n";
			print O "16\n";
			print O "ROTATION\n";
				my $x = $i * 10;
				my $Ry= RyMatrix($x);
			print O " $Ry->[0][0]\t $Ry->[0][1]\t $Ry->[0][2]\n";
			print O " $Ry->[1][0]\t $Ry->[1][1]\t $Ry->[1][2]\n";
			print O " $Ry->[2][0]\t $Ry->[2][1]\t $Ry->[2][2]\n";
			}
		else
			{
			print O "$_\n";
			}
		}
		system ("render -png -size 150x200 <$input_file.ball.$i.r3d >$input_file.ball.$i.png");
	}
sub RyMatrix
        {
        my $theta = shift;
        my $th = deg2rad($theta);
        my $ry = [ [ cos($th), 0,-sin($th)],
                   [ 0,        1,       0],
                   [ sin($th), 0, cos($th)]  ];
	return $ry;
        }

