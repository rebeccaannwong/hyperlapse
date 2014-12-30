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
  end
  end



end
