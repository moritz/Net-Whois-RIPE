package Net::Whois::Object::Information;

use base qw/Net::Whois::Object/;

=head1 NAME

Net::Whois::Object::Information - an object representation of the RPSL Information block

=head1 DESCRIPTION

output starting with the % sign is either a server response code or
an informational message. A comment contains a white space after the
% sign, while server messages start right after the % sign. Please
see Appendix A2 "RIPE Database response codes and messages" for more
information.

* An empty line ("\n\n") is an object delimiter. 

* Two empty lines mean the end of a server response. The "members:" attribute lists the members of the set.  The
"members:" attribute is a list of AS numbers, or other as-set names.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::Information class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'mandatory', ['comment'] );
    $self->attributes( 'optionnal', [] );
    $self->attributes( 'multiple',  ['comment'] );

    return $self;
}

=head2 B<comment( [$comment] )>

Accessor to the comment attribute.
Accepts an optional comment to be added to the comment array,
always return the current comment array.

=cut

sub comment {
    my ( $self, $comment ) = @_;

    return $self->_multiple_attribute_setget( 'comment', $comment );
}

1;
