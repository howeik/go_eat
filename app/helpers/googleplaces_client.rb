
module GPlaceHelper
  class Client
    def places(api_key, lat, lon)
      @client = GooglePlaces::Client.new(api_key)
      puts 'thisisthelat'
      puts lat
      puts 'thisisthelat'
      @client.spots(lat,
                    lon,
                    :types => ['restaurant','food'],
                    :radius => 8000)
    end
  end
end
