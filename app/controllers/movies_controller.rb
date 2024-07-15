class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
  
  def add
    x = Movie.new

    x.title = params.fetch("title")
    x.year = params.fetch("year")
    x.duration = params.fetch("duration")
    x.description = params.fetch("description")
    x.image = params.fetch("image")
    x.director_id = params.fetch("director_id")

    x.save

    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

end
