# watch -*-perl-*-

use strict;
use Test::More tests => 4;
use Event ();

require Config;
require Event::MakeMaker;

my $path = $Event::MakeMaker::installsitearch;
my $so   = $Config::Config{so};

my $inline = {
    INC          => "-I $path/Event",
    TYPEMAPS     => "$path/Event/typemap",
    MYEXTLIB     => "$path/auto/Event/Event.$so",
    AUTO_INCLUDE => '#include "EventAPI.h"',
    BOOT         => 'I_EVENT_API("Inline");',
};

is_deeply $inline, Event->Inline(q{C});
is_deeply $inline, Event->Inline(q{NotC});
is_deeply $inline, Event->Inline(q{});
is_deeply $inline, Event->Inline(undef);
