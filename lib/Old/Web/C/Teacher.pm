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



1;
