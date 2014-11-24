package Old::Web::C::Teacher;

use strict;
use warnings;
use utf8;
use Data::Dumper;
use Old::Model::Pref;

my $pref = new Old::Model::Pref();
my @prefs = $pref->show();

sub teacherregister{
 my($class,$c) = @_;
 return $c->render('teacher_register.tx',{prefs => \@prefs});
}

sub register{
 my($class,$c) = @_;
 print Dumper $c->req->parameters;
 $c->db->register_teacher($c->req->parameters);
 return $c->redirect('/home');
}

sub detail{
 my($class,$c,$args) = @_;
 my $itr = $c->db->search_teacher_by_id($args);
 my $name = $itr->name;
 return $c->render('detail.tx',{name => $name});
}

sub show{
 my($class,$c) = @_;
 return $c->render('show.tx');
}

sub pref1{
 my($class,$c) = @_;
 return $c->render('pref1.tx');
}

sub pref2{
 my($class,$c) = @_;
 return $c->render('pref2.tx');
}

sub prefshow{
 my($class,$c,$args) = @_;
 my $itr = $c->db->search_teacher_by_prefid($args);
 my $teachers = [];
 while(my $row = $itr->next){
    push @$teachers,{id => $row->id,name => $row->name,prefecture => $row->prefecture};
 } 
 return $c->render_json($teachers);
}


1;
