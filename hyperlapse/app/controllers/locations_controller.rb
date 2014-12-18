
class LocationsController < ApplicationController

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def show
    puts params[:lat]
    puts params[:long]
  end

  def create
    @location = Location.new
    @location.latitude
    @location.longitude
  end

  #INDEX, SHOW, NEW, CREATE
  # use params[:latitude] to set new location

end
