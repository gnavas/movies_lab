class ActorMoviesController < ApplicationController
skip_before_action :verify_authenticity_token
    def create
    movie_id = (Movie.find(params[:id])).id
    @actormovie = ActorMovie.new(movie_id: movie_id, actor_id: params[:actor_id])
    @actormovie.save
    redirect_to movies_path 
    end

end
