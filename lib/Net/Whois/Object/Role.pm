package Net::Whois::Object::Role;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-23
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/role
#
# role:          [mandatory]  [single]     [lookup key]
# address:       [mandatory]  [multiple]   [ ]
# phone:         [optional]   [multiple]   [ ]
# fax-no:        [optional]   [multiple]   [ ]
# e-mail:        [mandatory]  [multiple]   [lookup key]
# trouble:       [optional]   [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# nic-hdl:       [mandatory]  [single]     [primary/look-up key]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::Role - an object representation of the RPSL Role block

=head1 DESCRIPTION

The role class is similar to the person class.  However, instead of
describing a human being, it describes a role performed by one or more
human beings.  Examples include help desks, network monitoring
centres, system administrators, etc.  A role object is particularly
useful since often a person performing a role may change; however the
role itself remains. The "nic-hdl:" attributes of the person and role
classes share the same name space. Once the object is created, the
value of the "role:" attribute cannot be changed.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Role class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'primary', ['nic_hdl'] );
    $self->attributes( 'mandatory', [ 'role', 'address', 'e_mail', 'tech_c', 'admin_c', 'nic_hdl', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'phone', 'fax_no', 'trouble', 'remarks', 'notify', 'mnt_by' ] );
    $self->attributes( 'single', [ 'role', 'nic_hdl', 'source' ] );
    $self->attributes( 'multiple', [ 'address', 'e_mail', 'tech_c', 'admin_c', 'changed', 'phone', 'fax_no', 'trouble', 'remarks', 'notify', 'mnt_by' ] );

    return $self;
}

=head2 B<role( [$role] )>

Accessor to the role attribute.
Accepts an optional role, always return the current role.

=cut

sub role {
    my ( $self, $role ) = @_;

    return $self->_single_attribute_setget( 'role', $role );
}

=head2 B<address( [$address] )>

Accessor to the address attribute.
Accepts an optional address line to be added to the address array,
always return the current address array.

=cut

sub address {
    my ( $self, $address ) = @_;

    return $self->_multiple_attribute_setget( 'address', $address );
}

=head2 B<phone( [$phone] )>

Accessor to the phone attribute.
Accepts an optional phone to be added to the phone array,
always return the current phone array.

=cut

sub phone {
    my ( $self, $phone ) = @_;

    return $self->_multiple_attribute_setget( 'phone', $phone );
}

=head2 B<fax_no( [$fax_no] )>

Accessor to the fax_no attribute.
Accepts an optional fax_no to be added to the fax_no array,
always return the current fax_no array.

=cut

sub fax_no {
    my ( $self, $fax_no ) = @_;

    return $self->_multiple_attribute_setget( 'fax_no', $fax_no );
}

=head2 B<e_mail( [$e_mail] )>

Accessor to the e_mail attribute.
Accepts an optional e_mail to be added to the e_mail array,
always return the current e_mail array.

=cut

sub e_mail {
    my ( $self, $e_mail ) = @_;

    return $self->_multiple_attribute_setget( 'e_mail', $e_mail );
}

=head2 B<trouble( [$trouble] )>

Accessor to the trouble attribute.
Accepts an optional trouble value to be added to the trouble array,
always return the current trouble array.

=cut

sub trouble {
    my ( $self, $trouble ) = @_;

    return $self->_multiple_attribute_setget( 'trouble', $trouble );
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

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'tech_c', $contact );
}

=head2 B<nic_hdl( [$nic_hdl] )>

Accessor to the nic_hdl attribute.
Accepts an optional nic_hdl, always return the current nic_hdl.

=cut

sub nic_hdl {
    my ( $self, $nic_hdl ) = @_;

    return $self->_single_attribute_setget( 'nic_hdl', $nic_hdl );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
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

1;
