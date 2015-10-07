use v6;

grammar Parse::Selenese::Grammar {
  token TOP {
    ^
    '<?xml version="1.0" encoding="UTF-8"?>'
    "\n"
    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'
    "\n"
    '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">'
    "\n"
    '<head profile="' <profile> '">'
    "\n"
    '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'
    "\n"
    '<link rel="selenium.base" href="' <base_url> '" />'
    "\n"
    <title>
    "\n"
    '</head>'
    "\n"
    '<body>'
    "\n"
    '<table cellpadding="1" cellspacing="1" border="1">'
    "\n"
    '<thead>'
    "\n"
    '<tr><td rowspan="1" colspan="3">' .+? '</td></tr>'
    "\n"
    '</thead><tbody>'
    "\n"
    <commands>
    "\n"
    '</tbody></table>'
    "\n"
    '</body>'
    "\n"
    '</html>'
    "\n"
    $
  }

  token title {
    '<title>' $<value>=.+? '</title>'
  }
  
  token commands {
    $<value>=(<command>*)
  }

  token profile {
    'http://selenium-ide.openqa.org/profiles/'
    $<value>=('test-case' | 'test-suite')
  }
  
  token base_url {
    $<value>='http://some-server:3000/'
  }

  token command {
    '<tr>'
    "\n"
    "\t" '<td>' $<name>=<command_name> '</td>'
    "\n"
    "\t" '<td>' .+? '</td>'
    "\n"
    "\t" '<td>' .+? '</td>'
    "\n"
    '</tr>'
    "\n"
  }
  
  token argument {
    .+?
  }

  token command_name {
      'open'
    | 'type'
  	| 'clickAndWait'
    | 'verifyTitle'
  }
}
