package Net::Whois::Object::InetNum;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-13
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inetnum
#
# inetnum:       [mandatory]  [single]     [primary/look-up key]
# netname:       [mandatory]  [single]     [lookup key]
# descr:         [mandatory]  [multiple]   [ ]
# country:       [mandatory]  [multiple]   [ ]
# org:           [optional]   [single]     [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# status:        [mandatory]  [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# mnt-domains:   [optional]   [multiple]   [inverse key]
# mnt-irt:       [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From  http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inetnum?view=text-only
#
# mnt-irt:        [mandatory]  [multiple]   [inverse key]
#

=head1 NAME

Net::Whois::Object::InetNum - an object representation of a RPSL InetNum block

=head1 DESCRIPTION

An inetnum object contains information on allocations and assignments
of IPv4 address space.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::InetNum class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'primary', ['inetnum'] );
    $self->attributes( 'mandatory', [ 'inetnum', 'netname', 'descr', 'country', 'tech_c', 'admin_c', 'status', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'org', 'remarks', 'notify', 'mnt_lower', 'mnt_routes', 'mnt_domains', 'mnt_irt' ] );
    $self->attributes( 'single', [ 'inetnum', 'netname', 'org', 'status', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'country', 'tech_c', 'admin_c', 'remarks', 'notify', 'mnt_by', 'mnt_lower', 'mnt_routes', 'mnt_domains', 'mnt_irt', 'changed' ] );

    return $self;
}

=head2 B<inetnum( [$inetnum] )>

Accessor to the inetnum attribute.
Accepts an optional inetnum value, always return the current inetnum value.

=cut

sub inetnum {
    my ( $self, $inetnum ) = @_;

    return $self->_single_attribute_setget( 'inetnum', $inetnum );
}

=head2 B<netname( [$netname] )>

Accessor to the netname attribute.
Accepts an optional netname, always return the current netname.

=cut

sub netname {
    my ( $self, $netname ) = @_;

    return $self->_single_attribute_setget( 'netname', $netname );
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr value to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget( 'descr', $descr );
}

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional country to be added to the country array,
always return the current country array.

=cut

sub country {
    my ( $self, $country ) = @_;

    return $self->_multiple_attribute_setget( 'country', $country );
}

=head2 B<org( [$org] )>

Accessor to the 'org' attribute.
Accepts an optional org, always return the current org.

Only a single value for the org attribute is allowed in the Inetnum object.
This is to ensure only one organisation is responsible for this resource.

=cut

sub org {
    my ( $self, $org ) = @_;

    return $self->_single_attribute_setget( 'org', $org );
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact Person object. As more than one person
often fulfills a role function, there may be more than one admin_c listed.

An administrative contact (admin_c) must be someone who is physically
located at the site of the network.

=cut

sub admin_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'admin_c', $contact );
}

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

The NIC-handle of a technical contact Person or Role object.  As more than
one person often fulfills a role function, there may be more than one tech_c
listed.

A technical contact (tech_c) must be a person responsible for the
day-to-day operation of the network, but does not need to be
physically located at the site of the network.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'tech_c', $contact );
}

=head2 B<status( [$status] )>

Accessor to the 'status' attribute.
Accepts an optional status, always return the current status.

The status attribute indicates where the address range represented by an
inetnum object sits in a hierarchy and how it is used.

Status can have one of these values:

=over 4

=item ALLOCATED UNSPECIFIED

=item ALLOCATED PA

=item ALLOCATED PI

=item LIR-PARTITIONED PA

=item LIR-PARTITIONED PI

=item SUB-ALLOCATED PA

=item ASSIGNED PA

=item ASSIGNED PI

=item ASSIGNED ANYCAST

=item EARLY-REGISTRATION

=item NOT-SET

=back

=cut

sub status {
    my ( $self, $status ) = @_;

    return $self->_single_attribute_setget( 'status', $status );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

General remarks. May include a URL or instructions on where to send abuse
complaints.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

The email address to which notifications of changes to this object should be
sent.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

Lists a registered Mntner used to authorize and authenticate changes to this
object.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_by', $mnt_by );
}

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

Sometimes there is a hierarchy of maintainers. In these cases, mnt_lower is
used as well as mnt_by.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_lower', $mnt_lower );
}

=head2 B<mnt_routes( [$mnt_route] )>

Accessor to the mnt_routes attribute.
Accepts an optional mnt_route to be added to the mnt_routes array,
always return the current mnt_routes array.

The identifier of a registered Mntner object used to control the creation of
Route objects associated with the address range specified by the Inetnum
object.

=cut

sub mnt_routes {
    my ( $self, $mnt_route ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_routes', $mnt_route );
}

=head2 B<mnt_domains( [$mnt_domain] )>

Accessor to the mnt_domains attribute.
Accepts an optional mnt_domain to be added to the mnt_domains array,
always return the current mnt_domains array.

The identifier of a registered Mntner object used to control the creation of
Domain objects associated with the address range specified by the Inetnum
object.

=cut

sub mnt_domains {
    my ( $self, $mnt_domain ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_domains', $mnt_domain );
}

=head2 B<changed( [$changed] )>

Accessor to the changed attribute.
Accepts an optional changed value to be added to the changed array,
always return the current changed array.

The email address of who last updated the database object and the date it
occurred.

Every time a change is made to a database object, this attribute will show
the email address of the person who made those changes.
Please use the address format specified in RFC 822 - Standard for
the Format of ARPA Internet Text Message and provide the date
format using one of the following two formats: YYYYMMDD or YYMMDD.

=cut

sub changed {
    my ( $self, $changed ) = @_;

    return $self->_multiple_attribute_setget( 'changed', $changed );
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

The database where the object is registered.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget( 'source', $source );
}

=head2 B<mnt_irt( [$mnt_irt] )>

Accessor to the mnt_irt attribute.
Accepts an optional mnt_irt value to be added to the mnt_irt array,
always return the current mnt_irt array.

The identifier of a registered Mntner object used to provide information
about a Computer Security Incident Response Team (CSIRT).

=cut

sub mnt_irt {
    my ( $self, $mnt_irt ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_irt', $mnt_irt );
}

1;
