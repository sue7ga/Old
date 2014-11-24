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

get '/teachers/list' => "Teacher#teacherlist";

get '/pref1' => "Teacher#pref1";

get '/pref2' => "Teacher#pref2";

get '/home/pref/:id' => "Teacher#prefshow";

post 'teacher/login/post' => "Teacher#postlogin";

get '/teacher/logout' => "Teacher#logout";

get 'students/list' => "Teacher#studentslist";

get 'student/list/:id' => "Teacher#showlist";

use Data::Dumper;

get 'students/show' => sub{
 my($c,$args) = @_;
 my $itr = $c->db->search_all_students();
 my $students= [];
 while(my $row = $itr->next){
 print Dumper $row->name;
   push @$students,{id => $row->id,name => $row->name,gender=> $row->gender,school => $row->school,prefecture => $row->prefecture};
 }
 return $c->render_json($students);
};


get 'teachers/show' => sub{
 my($c,$args) = @_;
 my $itr = $c->db->search_all_teachers();
 my $teachers = [];
 while(my $row = $itr->next){
 print Dumper $row->name;
   push @$teachers,{id => $row->id,name => $row->name,gender=> $row->gender,school => $row->school,prefecture => $row->prefecture};
 }
 return $c->render_json($teachers);
};

get 'teacher/show/:id' => "Teacher#detail";

#student

get 'student/register' => "Student#register";

post 'student/post/register' => "Student#postregister";

get 'student/login' => "Student#login";

post 'student/login/post' => "Student#postlogin";

get 'student/logout' => "Student#logout";

1;
