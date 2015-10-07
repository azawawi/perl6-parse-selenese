
use v6;

use Parse::Selenese::Command;

class Parse::Selenese::TestCase {
  has Str $.name is rw;
  has Str $.base_url is rw;
  has Parse::Selenese::Command @.commands is rw;
}
