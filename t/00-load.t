#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'JIRA::Attachments::Rename' );
}

diag( "Testing JIRA::Attachments::Rename $JIRA::Attachments::Rename::VERSION, Perl $], $^X" );
