# vi:filetype=

use t::atnodes;

plan tests => 3 * blocks();

no_diff();

run_tests();

__DATA__

=== TEST 1: no home
--- no_home
--- args: ls *
--- err
Can't find the home for the current user.
--- out
--- status: 2



=== TEST 2: no rc given
--- args: ls *
--- no_rc
--- out
--- err
Can't open **RC_FILE_PATH** for reading: No such file or directory
--- status: 2



=== TEST 3: no args given
--- rc
api=api01.foo.com api02.foo.com
--- args:
--- out
--- err
No argument specified.

USAGE:

    atnodes [OPTIONS] COMMAND... -- HOST_PATTERN... [OPTIONS]
    atnodes [OPTIONS] COMMAND HOST_PATTERN... [OPTIONS]

OPTIONS:
    -h            Print this help.
    -l            List the hosts and do nothing else.
    -p <port>     Port for the remote SSH service.
    -t <timeout>  Specify timeout for net traffic.
    -u <user>     User account for SSH login.
    -v            Being verbose

--- status: 1



=== TEST 4: no command
--- args: -- foo.com
--- out
--- err
No command specified.
--- status: 255



=== TEST 5: no expression
--- args: 'ls *'
--- out
--- err
No cluster expression specified.
--- status: 255



=== TEST 6: commands & expression
--- args: ls '*' -- foo.com '*.bar.cn' -l -v
--- rc
blah=foo
--- out
--- err
Command: [ls][*]
Cluster expression: foo.com *.bar.cn
Cluster set: foo.com
--- status: 0

