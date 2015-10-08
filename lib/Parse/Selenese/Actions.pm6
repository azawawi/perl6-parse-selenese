use v6;

use Parse::Selenese::Command;
use Parse::Selenese::TestCase;
use Parse::Selenese::TestSuite;

class Parse::Selenese::Actions {

  my @commands;

  method TOP($/) {
    my Str $name = ~$<title><value>;
    my Str $base_url = ~$<base_url><value>;
    my $test;
    if $<profile><value> eq 'test-case' {
      $test = Parse::Selenese::TestCase.new(:name($name), :base_url($base_url));
    } else {
      $test = Parse::Selenese::TestSuite.new(:name($name), :base_url($base_url));
    }

    $test.commands = @commands;

    make $test;
  }
  
  method command($/) {
    my $cmd = Parse::Selenese::Command.new;
    $cmd.name = ~$<name>;
    $cmd.arg1 = ~$<target> if $<target>.defined;
    $cmd.arg2 = ~$<value>  if $<value>.defined;

    push @commands, $cmd;
    
    make $cmd;
  }
}
