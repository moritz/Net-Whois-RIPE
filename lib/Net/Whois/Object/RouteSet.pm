package Net::Whois::Object::RouteSet;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-26
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route-set
#
# route-set:     [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# members:       [optional]   [multiple]   [ ]
# mbrs-by-ref:   [optional]   [multiple]   [inverse key]
# remarks:       [optional]   [multiple]   [ ]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From  http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route-set
#
# mp-members:     [optional]   [multiple]   [ ]
# mnt-lower:      [optional]   [multiple]   [inverse key]

=head1 NAME

Net::Whois::Object::RouteSet - an object representation of the RPSL RouteSet block

=head1 DESCRIPTION

A route-set object defines a set of routes that can be represented by
route objects or by address prefixes. In the first case, the set is
populated by means of the "mbrs-by-ref:" attribute, in the latter, the
members of the set are explicitly listed in the "members:"
attribute. The "members:" attribute is a list of address prefixes or
other route-set names.  Note that the route-set class is a set of
route prefixes, not of database route objects.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::RouteSet class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'primary', ['route_set'] );
    $self->attributes( 'mandatory', [ 'route_set', 'descr', 'tech_c', 'admin_c', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'members', 'mbrs_by_ref', 'remarks', 'notify' ] );
    $self->attributes( 'single', [ 'route_set', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'tech_c', 'admin_c', 'mnt_by', 'changed', 'members', 'mbrs_by_ref', 'remarks', 'notify' ] );

    return $self;
}

=head2 B<route_set( [$route_set] )>

Accessor to the route_set attribute.
Accepts an optional route_set, always return the current route_set.

=cut

sub route_set {
    my ( $self, $route_set ) = @_;

    return $self->_single_attribute_setget( 'route_set', $route_set );
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr line to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget( 'descr', $descr );
}

=head2 B<members( [$members] )>

Accessor to the members attribute.
Accepts an optional members value to be added to the members array,
always return the current members array.

=cut

sub members {
    my ( $self, $members ) = @_;

    return $self->_multiple_attribute_setget( 'members', $members );
}

=head2 B<mbrs_by_ref( [$mbrs_by_ref] )>

Accessor to the mbrs_by_ref attribute.
Accepts an optional mbrs_by_ref to be added to the mbrs_by_ref array,
        always return the current 'mbrs_by_ref' array.

=cut

sub mbrs_by_ref {
    my ( $self, $mbrs_by_ref ) = @_;

    return $self->_multiple_attribute_setget( 'mbrs_by_ref', $mbrs_by_ref );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remarks ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remarks );
}

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'tech_c', $contact );
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

=cut

sub admin_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'admin_c', $contact );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_by', $mnt_by );
}

=head2 B<changed( [$changed] )>

Accessor to the changed attribute.
Accepts an optional changed value to be added to the changed array,
always return the current changed array.

=cut

sub changed {
    my ( $self, $changed ) = @_;

    return $self->_multiple_attribute_setget( 'changed', $changed );
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget( 'source', $source );
}

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_lower', $mnt_lower );
}

=head2 B<mp_members( [$mp_member] )>

Accessor to the mp_members attribute.
Accepts an optional mp_member to be added to the mp_members array,
always return the current mp_members array.

=cut

sub mp_members {
    my ( $self, $mp_members ) = @_;

    return $self->_multiple_attribute_setget( 'mp_members', $mp_members );
}

1;
