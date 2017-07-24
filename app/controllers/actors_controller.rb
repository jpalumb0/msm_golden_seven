class ActorsController < ApplicationController
    def new_form
        render("actor_templates/new_form.html.erb")
    end
    
    def create_row
       
        source = params["the_source"]
        name = params["the_name"]
        dob = params["the_dob"]
        bio = params["the_bio"]
        
        a = Actor.new
        
        a.image_url = source
        a.name = name
        a.dob = dob
        a.bio = bio
        
        a.save
        
        redirect_to("/actors")
    end
    
    def index
        
        @actors = Actor.all.order(name: :asc)
        render("actor_templates/index.html.erb")
    end
    
    def show
       
       @actor = Actor.find(params["an_id"])
       
       render("actor_templates/show.html.erb")
    end
    
    def edit_form
        
        @actor = Actor.find(params["some_id"])
        
        render("actor_templates/edit_form.html.erb")
    end
    
    def update_row
        
        @actor = Actor.find(params["the_id"])
        
        new_source = params["the_source"]
        new_name = params["the_name"]
        new_dob = params["the_dob"]
        new_bio = params["the_bio"]
        
        @actor.image_url = new_source
        @actor.name = new_name
        @actor.dob = new_dob
        @actor.bio = new_bio
        
        
        @actor.save
        
        redirect_to("/actors/"+@actor.id.to_s)
    end
    
    def destroy_row
        
        @actor = Actor.find(params["toast_id"])
        @actor.destroy
        
        redirect_to("/actors")
    end
end