# This -*- perl -*- script makes the Makefile

require 5.005; #most likely

use ExtUtils::MakeMaker;

# Parasoft's Insure++!
push @Safe, OPTIMIZE => '-g' if 0;
push @Safe, CC => 'insure', LD => 'insure', OPTIMIZE => '-g' if 0;

my @opt=(PREREQ_PM => { Test => 1 },
	 VERSION_FROM	=> "./lib/Event.pm",
	 NAME      	=> "Event",
	 TYPEMAPS       => ['./lib/Event/typemap'],
	 INC		=> '-Ic -Ilib/Event',
	 H		=> [glob("c/*"), glob("*.h"), "lib/Event/EventAPI.h"],
	 @Safe,
	 'clean'   	=> {FILES => join(" ",
					  map { "$_ */$_ */*/$_" }
					  qw(*% *.html *.b[ac]k *.old *.orig))
			   },
	);

WriteMakefile(@opt);
