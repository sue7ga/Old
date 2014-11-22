package Old::Web::C::Root;

use strict;
use warnings;
use utf8;

sub root{
 my($class,$c) = @_;
 return $c->render('index.tx');
}

sub home{
 my($class,$c) = @_;
 return $c->render('home.tx');
}

sub user{
 my($class,$c) = @_;
 return $c->render('user.tx');
}

sub setting{
 my($class,$c) = @_;
 return $c->render('setting.tx');
}

1;
