class Parse::Selenese::Actions {
    method TOP($/) {
      say "TOP!";
      say $/.perl;
        #$/.make(2 + ~$/);
    }
}
