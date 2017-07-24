class MoviesController < ApplicationController
    def new_form
        render("director_templates/new_form.html.erb")
    end
    
    def create_row
       
        source = params["the_source"]
        caption = params["the_caption"]
        
        p = Photo.new
        
        p.source = source
        p.caption = caption
        
        p.save
        
        redirect_to("/photos")
    end
    
    def index
        
        @directors = Director.all.order(created_at: :desc)
        render("director_templates/index.html.erb")
    end
    
    def show
       
       @pic = Photo.find(params["an_id"])
       
       render("director_templates/show.html.erb")
    end
    
    def edit_form
        
        @pic = Photo.find(params["some_id"])
        
        render("director_templates/edit_form.html.erb")
    end
    
    def update_row
        
        @pic = Photo.find(params["the_id"])
        
        new_source = params["the_source"]
        new_caption = params["the_caption"]
        
        @pic.source = new_source
        @pic.caption = new_caption
        
        @pic.save
        
        redirect_to("/photos/"+@pic.id.to_s)
    end
    
    def destroy_row
        
        @pic = Photo.find(params["toast_id"])
        @pic.destroy
        
        redirect_to("/photos")
    end
end