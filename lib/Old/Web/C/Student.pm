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

sub login{
 my($class,$c) = @_;
 return $c->render('student_login.tx');
}

sub postlogin{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 my $itr = $c->db->get_student_by_email($param);
 if($itr->password eq $param->{key}){
    $c->session->set('student' => 1);    
    return $c->render('student_home.tx');
 }else{
  return $c->redirect('/student/register');
 }
}

sub logout{
 my($class,$c) = @_;
 $c->session->set('student' => 0);
 return $c->redirect('/student/login');
}

1;
