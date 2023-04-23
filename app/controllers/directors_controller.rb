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
    @director_id = params.fetch("director_id")
    director = Director.where({:id =>@director_id}).at(0)
    @director_name = director.name
    @director_dob = director.dob
    @director_bio = director.bio
    @director_image = director.image
    render({ :template =>"directors_templates/detail.html.erb"})
  end
end
