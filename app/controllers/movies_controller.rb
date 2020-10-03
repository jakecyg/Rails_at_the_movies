class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    # above gets the job done but introduces n+1 when sub selects of the movie objects are made; ex. select the production comp for each movie queried
    # solution:
    @movies = Movie.includes(:production_company).order('average_vote DESC')
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
