class ActorMoviesController < ApplicationController
skip_before_action :verify_authenticity_token
    def create
    movie_id = (Movie.find(params[:id])).id
    @movie = Movie.find(params[:id])
    @actormovie = ActorMovie.new(movie_id: movie_id, actor_id: params[:actor_id])
    @actormovie.save
    redirect_to movie_path(@movie)
    end

    def update
    actor_id = (Actor.find(params[:id])).id
    @actor = Actor.find(params[:id])
    @actormovie = ActorMovie.new(actor_id: actor_id, movie_id: params[:movie_id])
    @actormovie.save
    redirect_to actor_path(@actor)
    end

    def destroy
    @actor = Actor.find(params[:id])
    movie = ActorMovie.find_by(movie_id: params[:movie_id])
    movie.destroy
    redirect_to actor_path(@actor)  
    end

end
