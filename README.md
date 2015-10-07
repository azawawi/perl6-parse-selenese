Parse::Selenese
===============

[![Build Status](https://travis-ci.org/azawawi/perl6-parse-selenese.svg?branch=master)](https://travis-ci.org/azawawi/perl6-parse-selenese)

This is a simple utility to parse Selenese test cases and suites that are
usually generated from the Selenium IDE.

## Example

```
use Parse::Selenese;

my $selenese = "example.selenese".IO.slurp;

my $parser = Parse::Selenese.new;
my $result = $parser.parse($selenese);
if $result {
  say "Matches with the following results: " ~ $result.ast.perl;
} else {
  say "Fails";
}
```

## Testing

To run tests:

    prove -e perl6

## Author

Ahmad M. Zawawi, azawawi on #perl6, https://github.com/azawawi/

## License

Artistic License 2.0
