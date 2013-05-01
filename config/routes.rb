Rails.application.routes.draw do
  get '/', :controller => 'my_admin/users', :action => :index
  get '/roles', :controller => 'my_admin/user_roles', :action => :index
  
  namespace :my_admin do
    #resources :universities
    #resources :users
    #resources :faculties
  end
  
  get 'admin_area/universities', :controller => 'my_admin/universities', :action => :index
  get 'admin_area/universities/edit', :controller => 'my_admin/universities', :action => :edit
  
  get 'admin_area/users', :controller => 'my_admin/users', :action => :index
  get 'admin_area/users/edit', :controller => 'my_admin/users', :action => :edit
  
  get 'admin_area/faculties', :controller => 'my_admin/faculties', :action => :index
  get 'admin_area/faculties/edit', :controller => 'my_admin/faculties', :action => :edit
  
  #get '/universities', :controller => 'my_admin/university', :action => :index
  #get "/:modl", :controller => "my_admin/:modl", :action => :index
  get '/faculties', :controller => 'my_admin/faculty', :action => :index
  match 'user/:action', :controller => 'my_admin/user', :action => :action
  match 'admin_area/model/:model/:action', :controller => 'my_admin/model', :model => :model, :action => :action
end