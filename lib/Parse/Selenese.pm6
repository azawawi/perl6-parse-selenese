
use v6;

use Parse::Selenese::Grammar;

class Parse::Selenese {
  method parse(Str $source) {
    return Parse::Selenese::Grammar.parse($source);
  }
}