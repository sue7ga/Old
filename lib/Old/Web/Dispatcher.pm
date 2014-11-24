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

#teacher

get '/teacherregister' => "Teacher#teacherregister";

post '/register' => "Teacher#register";

post '/show' => "Teacher#show";

get '/search' => "Teacher#search";

get '/teacher/login' => "Teacher#login";

get '/pref1' => "Teacher#pref1";

get '/pref2' => "Teacher#pref2";

get '/home/pref/:id' => "Teacher#prefshow";

post 'teacher/login/post' => "Teacher#postlogin";

get '/teacher/logout' => "Teacher#logout";

get 'students/list' => "Teacher#list";

get 'student/list/:id' => "Teacher#showlist";

get 'students/show' => sub{
 my($c,$args) = @_;
 my $itr = $c->db->search_all_students();
 my $students= [];
 while(my $row = $itr->next){
   push @$students,{id => $row->id,name => $row->name,gender=> $row->gender,school => $row->school,prefecture => $row->prefecture};
 }
 return $c->render_json($students);
};

get 'teacher/show' => sub{
 my($c,$args) = @_;
 my $itr = $c->db->search_all_students();
 my $teachers = [];
 while(my $row = $itr->next){
   push @$teachers,{id => $row->id,name => $row->name,gender=> $row->gender,school => $row->school,prefecture => $row->prefecture};
 }
 return $c->render_json($teachers);
};

get 'teacher/show/:id' => "Teacher#detail";

#student

get 'student/register' => "Student#register";

post 'student/post/register' => "Student#postregister";

1;
