package Old::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub register_teacher{
 my($self,$args) = @_;
 $self->insert('teachers',{email => $args->{email},password=>$args->{password},name => $args->{name},school => $args->{school},age => $args->{age},prefecture=> $args->{prefecture},income => $args->{income},day => $args->{day},teaching => $args->{teaching},profile => $args->{profile},gender => $args->{gender}});
}

sub search_all_teachers{
 my ($self) = @_;
 my $itr =  $self->search('teachers');
 return $itr;
}

sub search_all_students{
 my ($self) = @_;
 my $itr =  $self->search('students');
 return $itr;
}
use Data::Dumper;

sub search_teacher_by_id{
 my($self,$args) = @_;
 my $itr = $self->single("teachers",{id => $args->{id}});
 return $itr;
}

sub search_student_by_id{
 my($self,$args) = @_;
 my $itr = $self->single("students",{id => $args->{id}});
 return $itr;
}

sub search_teacher_by_prefid{
 my($self,$args) = @_;
 my %pref =(1 => '神奈川県',2 => '長野県');
 my $prefname = $pref{$args->{id}};
 my $preitr = $self->single('teachers',+{prefecture =>$prefname},+{columns => [qw/prefecture/]});
 my $itr = $self->search('teachers',{prefecture => $preitr->prefecture});
 return $itr;
}

sub get_teacher_by_email{
 my($self,$param) = @_;
 my $itr = $self->single('teachers',+{email => $param->{email}},+{columns => [qw/password/]});
 return $itr;
}

sub get_student_by_email{
 my($self,$param) = @_;
 my $itr = $self->single('students',+{email => $param->{email}},+{columns => [qw/password/]});
 return $itr;
}

sub latest_teachers{
 my($self) = @_;
 my @rows = $self->search(
   'teachers',{},{order_by => {'age' => 'DESC'},limit => 10}
 );
 return \@rows;
}

sub register_student{
 my($self,$args) = @_;
 $self->insert('students',{email => $args->{email},password=>$args->{password},name => $args->{name},school => $args->{school},age => $args->{age},prefecture=> $args->{prefecture},income => $args->{income},day => $args->{day},income => $args->{income},profile => $args->{profile},gender => $args->{gender}});
}


1;


