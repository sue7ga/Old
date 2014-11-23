package Old::Web::C::Root;

use strict;
use warnings;
use utf8;
use Data::Dumper;

sub root{
 my($class,$c) = @_;
 return $c->render('index.tx');
}

sub home{
 my($class,$c) = @_;
 return $c->render('home.tx');
}

sub posthome{
my($class,$c,$args) = @_;
print Dumper $c->req->parameters;
 return $c->render('home.tx');
}

sub user{
 my($class,$c) = @_;
 return $c->render('user.tx');
}

sub teacherregister{
 my($class,$c) = @_;
 return $c->render('teacher_register.tx');
}


sub setting{
 my($class,$c) = @_; 
 return $c->render('setting.tx');
}

use Data::Dumper;

sub register{
 my($class,$c,$args) = @_;
 print Dumper $c->req->parameters;
 return $c->redirect('setting.tx');
}

1;
