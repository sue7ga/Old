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

post '/show' => "Teacher#show";

get '/pref1' => "Teacher#pref1";
get '/pref2' => "Teacher#pref2";

get '/home/pref/:id' => "Teacher#prefshow";


get 'teachers/show' => sub{
 my($c,$args) = @_;
 my $itr = $c->db->search_all_teachers();
 my $teachers = [];
 while(my $row = $itr->next){
   push @$teachers,{id => $row->id,name => $row->name,gender=> $row->gender,school => $row->school,prefecture => $row->prefecture};
 }
 return $c->render_json($teachers);
};

get 'teacher/show/:id' => "Teacher#detail";

1;
