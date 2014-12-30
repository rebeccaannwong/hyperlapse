class FoursquareAPI

  def self.foursquare(lat,long)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{lat},#{long}&limit=150&client_id=N40X4UZPFBP4XFBVRBWIOSSA13YHNXXSF1AYB2TSKLJEYSAF&client_secret=XWDWQYYR4VX3DMXCGYPMFDXN0KNKKWHCAH22USBDJCFVMMW3&v=20141206&m=foursquare&section=sights")
  parsed_response = JSON.parse(response.body)
  parsed_response["response"]["groups"][0]["items"]
  end

  def self.get_foursquare_info(lat,long)
    venues = foursquare(lat,long)
    venueInfo = venues.map do |venue|
      {
        name: venue["venue"]["name"],
        long: venue["venue"]["location"]["lng"],
        lat: venue["venue"]["location"]["lat"],
        address: venue["venue"]["location"]["formattedAddress"],
        prefix: = venue["venue"]["categories"][0]["icon"]["prefix"]
        suffix: = venue["venue"]["categories"][0]["icon"]["suffix"]
      }
    end
    venueInfo
  end

  # def self.get_address
  #   locations = Geocoder.search(params[:search])
  #   address = locations[0].data["geometry"]["location"]
  #     lat = address["lat"]
  #     long = address["lng"]
  #   return {lat: lat, long: long}
  # end
  #

  def self.get_address
    locations = Geocoder.search(HTTParty.get('http://api.ipify.org?format=json')["ip"])
    address = locations[0].data["geometry"]["location"]
    lat = address["lat"]
    long = address["lng"]
    return {lat: lat, long: long}
  end


end
