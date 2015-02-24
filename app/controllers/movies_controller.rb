class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new movie_params 
    if @movie.save
      redirect_to movies_path
    else
      render :new  
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie = Movie.update_attributes movie_params
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private 

    def movie_params
    params.require(:movie).permit(:title, :year)
    end  
end
