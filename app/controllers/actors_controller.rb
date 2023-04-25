class ActorsController < ApplicationController

  def index
    render({ :template =>"actors_templates/index.html.erb"})
  end

  def detail_page
    require 'time'
    @actor_id = params.fetch("actor_id")
    actor = Actor.where({:id =>@actor_id}).at(0)
    @actor_name = actor.name
    @actor_dob = actor.dob
    @actor_bio = actor.bio
    @actor_image = actor.image
    actor_created = actor.created_at.strftime("%Y").to_i
    actor_updated = actor.updated_at.strftime("%Y").to_i
    current_year = Time.now.strftime("%Y").to_i
    @year_created = current_year - actor_created
    @year_updated = current_year - actor_updated
    render({ :template =>"actors_templates/detail.html.erb"})
  end
end
