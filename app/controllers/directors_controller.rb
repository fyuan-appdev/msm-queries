class DirectorsController < ApplicationController

  def index
    render({ :template =>"directors_templates/index.html.erb"})
  end

  def eldest
    @eldest = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
    render({ :template =>"directors_templates/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
    render({ :template =>"directors_templates/youngest.html.erb"})
  end

  def detail_page
    require 'time'
    @director_id = params.fetch("director_id")
    director = Director.where({:id =>@director_id}).at(0)
    @director_name = director.name
    @director_dob = director.dob
    @director_bio = director.bio
    @director_image = director.image
    director_created = director.created_at.strftime("%Y").to_i
    director_updated = director.updated_at.strftime("%Y").to_i
    current_year = Time.now.strftime("%Y").to_i
    @year_created = current_year - director_created
    @year_updated = current_year - director_updated
    render({ :template =>"directors_templates/detail.html.erb"})
  end
end
