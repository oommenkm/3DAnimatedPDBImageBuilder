#!/usr/bin/perl
use Image::Magick;
$outfile = shift || "pdb";

$out = new Image::Magick;
   foreach $i(0 .. 35) {
	$img = new Image::Magick;
	$file = $outfile.".ball".".".$i.".png";

print"$file\n\n";
	$img->Read($file);
	push @$out,$img;
	}	
$out->[0]->Coalesce();
$out->Set(delay=> 10 );
$out->Write("$outfile".".balls".".3.4.gif");
