Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get("/", { :controller => "directors", :action => "index" })
  
  #DIRECTORS
  
  # CREATE
  get("/directors/new_form", { :controller => "directors", :action => "new_form" })
  get("/create_director", { :controller => "directors", :action => "create_row" })

  # READ
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:an_id", { :controller => "directors", :action => "show" })

  # UPDATE
  get("/directors/:some_id/edit_form", { :controller => "directors", :action => "edit_form" })
  get("/update_directors/:the_id", { :controller => "directors", :action => "update_row" })

  # DELETE
  get("/delete_director/:toast_id", { :controller => "directors", :action => "destroy_row" })
  
  #ACTORS
  
  # CREATE
  get("/actors/new_form", { :controller => "actors", :action => "new_form" })
  get("/create_actor", { :controller => "actors", :action => "create_row" })

  # READ
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:an_id", { :controller => "actors", :action => "show" })

  # UPDATE
  get("/actors/:some_id/edit_form", { :controller => "actors", :action => "edit_form" })
  get("/update_actors/:the_id", { :controller => "actors", :action => "update_row" })

  # DELETE
  get("/delete_actor/:toast_id", { :controller => "actors", :action => "destroy_row" })

  #MOVIES
  
  # CREATE
  get("/movies/new_form", { :controller => "movies", :action => "new_form" })
  get("/create_movie", { :controller => "movies", :action => "create_row" })

  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:an_id", { :controller => "movies", :action => "show" })

  # UPDATE
  get("/movies/:some_id/edit_form", { :controller => "movies", :action => "edit_form" })
  get("/update_movies/:the_id", { :controller => "movies", :action => "update_row" })

  # DELETE
  get("/delete_movie/:toast_id", { :controller => "movies", :action => "destroy_row" })


  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
