class MoviesController < ApplicationController
    def new_form
        render("movie_templates/new_form.html.erb")
    end
    
    def create_row
       
        source = params["the_source"]
        title = params["the_title"]
        year = params["the_year"]
        description = params["the_description"]
        duration = params["the_duration"]
        
        m = Movie.new
        
        m.image_url = source
        m.title = title
        m.year = year
        m.description = description
        m.duration = duration
        
        m.save
        
        redirect_to("/movies")
    end
    
    def index
        
        @movies = Movie.all.order(title: :asc)
        render("movie_templates/index.html.erb")
    end
    
    def show
       
       @movie = Movie.find(params["an_id"])
       
       render("movie_templates/show.html.erb")
    end
    
    def edit_form
        
        @movie = Movie.find(params["some_id"])
        
        render("movie_templates/edit_form.html.erb")
    end
    
    def update_row
        
        @movie = Movie.find(params["the_id"])
        
        new_source = params["the_source"]
        new_title = params["the_title"]
        new_year = params["the_year"]
        new_description = params["the_description"]
        new_duration = params["the_duration"]
        
        @movie.image_url = new_source
        @movie.title = new_title
        @movie.year = new_year
        @movie.description = new_description
        @movie.duration = new_duration
        
        
        @movie.save
        
        redirect_to("/movies/"+@movie.id.to_s)
    end
    
    def destroy_row
        
        @movie = Movie.find(params["toast_id"])
        @movie.destroy
        
        redirect_to("/movies")
    end
end