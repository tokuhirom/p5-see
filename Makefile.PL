use inc::Module::Install;
name 'see';
all_from 'lib/see.pm';

requires 'Class::Inspector';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
