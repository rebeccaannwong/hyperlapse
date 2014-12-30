class FoursquareAPI

  def self.foursquare(lat,long)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{lat},#{long}&limit=150&client_id=N40X4UZPFBP4XFBVRBWIOSSA13YHNXXSF1AYB2TSKLJEYSAF&client_secret=XWDWQYYR4VX3DMXCGYPMFDXN0KNKKWHCAH22USBDJCFVMMW3&v=20141206&m=foursquare&section=sights")
  parsed_response = JSON.parse(response.body)
  parsed_response["response"]["groups"][0]["items"]
  end

  def self.get_foursquare_info(lat,long)
    venues = foursquare(lat,long)
    venueInfo = []
    venues.each do |venue|
      venuehash = {}
      venuehash[:name] = venue["venue"]["name"]
      venuehash[:long] = venue["venue"]["location"]["lng"]
      venuehash[:lat] = venue["venue"]["location"]["lat"]
      venuehash[:address] = venue["venue"]["location"]["formattedAddress"]
      # venuehash[:prefix] = venue["venue"]["categories"][0]["icon"]["prefix"]
      # venuehash[:suffix] = venue["venue"]["categories"][0]["icon"]["suffix"]
      venueInfo.push(venuehash)
    end
    return venueInfo
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

  # def self.get_current_location
  #   location = Geocoder.search(HTTParty.get('http://api.ipify.org?format=json')["ip"])[0]
  #   lat = location.data["latitude"]
  #   long = location.data["longitude"]
  #   return {lat: lat, long: long}
  # end

end
