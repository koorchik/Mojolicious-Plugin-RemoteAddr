use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::RemoteAddr',
  VERSION_FROM => 'lib/Mojolicious/Plugin/RemoteAddr.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '3.90'},
  test         => {TESTS => 't/*.t'}
);
