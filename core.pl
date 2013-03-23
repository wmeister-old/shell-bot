#!/usr/bin/perl

my @commands = ();
my $nick = $ARGV[0];
my $path = $ARGV[1];

sub slurp($) { 
    my $f = shift;
    open FH, $f;
    my $c = do {
        local $/;
        <FH>;
    };
    close FH;
    return $c; 
}

sub script_files {
    grep(!/^$ENV{HOME}\/ii\/script\/core.pl$/, map { chomp; $_ } `find ~/ii/script/$path -type f -maxdepth 1`);
}

sub reload_commands {
    @commands = ();
    print "Loading commands...\n";

    foreach my $script (script_files()) {
	push(@commands, [substr((split(/\n/, slurp $script))[1], 2), $script]);
	print "Loaded: $script\n";
    }
}

$path = "$path/" if $path ne '' && substr($path, -1) ne '/';
reload_commands();

while(<STDIN>) {
    print $_;
    next if /^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} <$nick>/;
    if(/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} <[^>]+> \s*.reload\s*$/) {
	reload_commands();
	next;
    }

    foreach my $command (@commands) {
	if($_ =~ /$command->[0]/) {
	    print "Triggered: ".$command->[1]."\n";
	    system($command->[1], $_);
	}
    }
}


