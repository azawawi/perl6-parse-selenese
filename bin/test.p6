#!/usr/bin/env perl6

use v6;

use lib 'lib';
use Parse::Selenese;

my $selenese = "login.selenese".IO.slurp;

my $parser = Parse::Selenese.new;
if $parser.parse($selenese) {
  say "Matches";
} else {
  say "Fails";
}