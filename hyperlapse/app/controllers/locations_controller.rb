require 'foursquareapi'

class LocationsController < ApplicationController

  def index
    @input = params[:search]

    # Extract latitude and longitude from Geocoder
    if (params[:search] != nil)
      address = Geocoder.search(params[:search])

      if address != nil
        location = address[0].data["geometry"]["location"]
        lat = location["lat"]
        long = location["lng"]
        @lat = lat
        @long = long
      end

      # Calling Foursquare API
      if (address != nil)
        @locations = FoursquareAPI.get_foursquare_info(@lat, @long)
      else
        @locations = FoursquareAPI.get_foursquare_info(37.81409525128964,-122.4775045005249)
      end

      # Extract names and locations of API response - saving to variable


    # foursquare_locations = @locations
    # foursquare_locations.each do |result
    #
    # Extract names and locations of API response - save to variable
    # Locations index page - iterate through variable, generate a link using the name and putting the lat and long in the link (remember that you need to do URL escape)
  end
  end



end
