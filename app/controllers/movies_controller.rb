class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.new
    @movie = Movie.find(params[:id])
  end
end
