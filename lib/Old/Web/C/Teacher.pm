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
 return $c->render('detail.tx',{name => $itr->name,prefecture => $itr->prefecture,email => $itr->email,school => $itr->school,age => $itr->age,profile =>$itr->profile,gender => $itr->gender});
}

sub search{
 my($class,$c) = @_;
 return $c->render('search.tx');
}

sub list{
 my($class,$c) = @_;
 return $c->render('list.tx');
}

sub postlogin{
 my($class,$c) = @_;
 my $param =   $c->req->parameters;
 my $teacher = $c->db->get_teacher_by_email($param);
 if($teacher->password eq $param->{key}){
  $c->session->set('teacher' => 1);
  print Dumper $c->session->get('teacher');
  return $c->render('login_home.tx');
 }else{
  return $c->redirect('/teacher/login');
 }
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

sub login{
 my($class,$c) = @_;
 return $c->render('login.tx');
}

sub logout{
 my($class,$c) = @_;
 $c->session->set('teacher'=> 0);
 return $c->redirect('/teacher/login')
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

sub showlist{
 my ($class,$c,$args) = @_;
 my $student = $c->db->search_student_by_id($args);
 return $c->render('showlist.tx',{name => $student->name});
}

1;
