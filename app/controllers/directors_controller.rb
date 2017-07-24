class DirectorsController < ApplicationController
    def new_form
        render("director_templates/new_form.html.erb")
    end
    
    def create_row
       
        source = params["the_source"]
        name = params["the_name"]
        dob = params["the_dob"]
        bio = params["the_bio"]
        
        d = Director.new
        
        d.image_url = source
        d.name = name
        d.dob = dob
        d.bio = bio
        
        d.save
        
        redirect_to("/directors")
    end
    
    def index
        
        @directors = Director.all.order(name: :asc)
        render("director_templates/index.html.erb")
    end
    
    def show
       
       @director = Director.find(params["an_id"])
       
       render("director_templates/show.html.erb")
    end
    
    def edit_form
        
        @director = Director.find(params["some_id"])
        
        render("director_templates/edit_form.html.erb")
    end
    
    def update_row
        
        @director = Director.find(params["the_id"])
        
        new_source = params["the_source"]
        new_name = params["the_name"]
        new_dob = params["the_dob"]
        new_bio = params["the_bio"]
        
        @director.image_url = new_source
        @director.name = new_name
        @director.dob = new_dob
        @director.bio = new_bio
        
        
        @director.save
        
        redirect_to("/directors/"+@director.id.to_s)
    end
    
    def destroy_row
        
        @director = Director.find(params["toast_id"])
        @director.destroy
        
        redirect_to("/directors")
    end
end