package JIRA::Attachments::Rename;

use warnings;
use strict;
use File::Find;

our $VERSION = '1.02';

sub new {
	my $class = shift;
	my $dir = shift;
	my $old_key = shift;
	my $new_key = shift;
	my $self = {
		Dir => $dir,
		Wanted => sub {
			my $old = $_;
			-d or return;
			$_ =~ s/^$old_key/$new_key/;
			-e and return;
			rename $old, $_ or warn "Can't rename $old to $_: $!";
		}
	};		
	bless $self, $class;
	return $self;
}

sub att_rename {
	my $self = shift;
	finddepth($self->get_wanted, $self->get_dir);
}

sub get_dir {
	my $self = shift;
	return $self->{Dir};
}

sub get_wanted {
	my $self = shift;
	return $self->{Wanted};
}

1; # End of JIRA::Attachments::Rename
__END__

=head1 NAME

JIRA::Attachments::Rename

=head1 VERSION

This documentation refers to version 1.01

=head1 SYNOPSIS

	my $sample = JIRA::Attachments::Rename->new("/tmp", "BDV", "BPV");
  $sample->att_rename();

=head1 DESCRIPTION

This module is used to rename JIRA attachment sub-directories after project keys
have been changed.

=head1 SUBROUTINES/METHODS

=head2 new($dir, $old_key, $new_key )

Takes a directory where JIRA attachments are located, an old project key and
and a new project key.

=head2 att_rename();

Call this function to rename the directories matching the key indicated in the constructor.

=head1 DEPENDENCIES

File::Find

=head1 DIAGNOSTICS

None

=head1 CONFIGURATION AND ENVIRONMENT

None

=head1 BUGS AND LIMITATIONS

None

=head1 AUTHOR

Martin-Louis Bright (mlbright@gmail.com)

=head1 COPYRIGHT

Perl standard distribution license.
