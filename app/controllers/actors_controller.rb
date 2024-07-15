class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add
    x = Actor.new

    x.name = params.fetch("name")
    x.dob = params.fetch("dob")
    x.bio = params.fetch("bio")
    x.image = params.fetch("image")

    x.save

    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def update
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      

    @the_actor.name = params.fetch("name")
    @the_actor.dob = params.fetch("dob")
    @the_actor.bio = params.fetch("bio")
    @the_actor.image = params.fetch("image")

    @the_actor.save

    render({ :template => "actor_templates/show" })
  end

  def delete
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)

    @the_actor.destroy

    redirect_to("/actors")
  end

  
end
