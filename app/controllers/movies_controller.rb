class MoviesController < ApplicationController

  def index
    render({ :template =>"movies_templates/index.html.erb"})
  end

  def detail_page
    require 'time'
    @movie_id = params.fetch("movie_id")
    movie = Movie.where({:id =>@movie_id}).at(0)
    @movie_title = movie.title
    @movie_year = movie.year
    @movie_duration = movie.duration
    @movie_description = movie.description
    @movie_image = movie.image
    director_id = movie.director_id
    director = Director.where({:id =>director_id}).at(0)
    @director_name = director.name
    movie_created = movie.created_at.strftime("%Y").to_i
    movie_updated = movie.updated_at.strftime("%Y").to_i
    current_year = Time.now.strftime("%Y").to_i
    @year_created = current_year - movie_created
    @year_updated = current_year - movie_updated
    render({ :template =>"movies_templates/detail.html.erb"})
  end
end
