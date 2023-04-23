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

end
