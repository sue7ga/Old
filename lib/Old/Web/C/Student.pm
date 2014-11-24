package Old::Web::C::Student;

use strict;
use warnings;
use utf8;
use Data::Dumper;
use Old::Model::Pref;

my $pref = new Old::Model::Pref();
my @prefs = $pref->show();

sub register{
 my($class,$c) = @_;
 return $c->render('student_register.tx',{prefs => \@prefs});
}

sub postregister{
 my($class,$c) = @_;
 print Dumper $c->req->parameters;
 $c->db->register_student($c->req->parameters);
 return $c->redirect('/student/register');
}


1;
