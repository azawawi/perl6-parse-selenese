use v6;

use Parse::Selenese::Command;
use Parse::Selenese::TestCase;
use Parse::Selenese::TestSuite;

class Parse::Selenese::Actions {
  has @commands;
  has $test;

  method TOP($/) {
    #say "TOP!";
    #  say $<profile><value>;
  }
  
  method profile($/) {
    if $<value> eq 'test-case' {
      $test = Parse::Selenese::TestCase;
    } else {
      $test = Parse::Selenese::TestSuite;
    }
  }
  
  method command($/) {
    my $cmd = Parse::Selenese::Command.new(
      :name(~$<name>),
      :arg1(~$<arg1>),
      :arg2(~$<arg2>)
    );
    
    @commands.push($cmd);
    
    say $cmd.name;
  }
}
