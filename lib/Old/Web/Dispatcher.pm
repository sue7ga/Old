package Old::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Module::Find;

useall 'Old::Web::C';
base 'Old::Web::C';

any '/' => "Root#root";

get '/home' => "Root#home";

post '/home' => "Root#posthome";

get '/user' => "Root#user";

get '/setting' => "Root#setting";

get '/teacherregister' => "Teacher#teacherregister";

post '/register' => "Teacher#register";



1;

