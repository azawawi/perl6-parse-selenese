#!/usr/bin/env perl6

use v6;

use lib 'lib';
use Parse::Selenese::Grammar;

my $selenese = "login.selenese".IO.slurp;

if  Parse::Selenese::Grammar.parse($selenese) {
  say "Matches";
} else {
  say "Fails";
}