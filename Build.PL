use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'JIRA::Attachments::Rename',
    license             => 'perl',
    dist_author         => 'Martyloo <mlbright@gmail.com>',
		dist_abstract				=> 'This module renames JIRA attachments to match changed project keys',
    dist_version_from   => 'lib/JIRA/Attachments/Rename.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'JIRA-Attachments-Rename-*' ],
);

$builder->create_build_script();
