
module GPlaceHelper
  class Client
    def places(api_key, lat, lon)
      @client = GooglePlaces::Client.new(api_key)
=begin
      @client.spots(lat,
                    lon,
                    :types => ['restaurant','food'],
                    :radius => 8000)
=end
      spots = @client.spots(lat, lon, :types => ['restaurant', 'food'], :radius => 8000)
      puts 'hi over here'
      puts spots
      puts 'done'
      #puts spots[0].formatted_phone_number
      puts 'wuh'
      puts spots[0][:formatted_phone_number]
      hasnum = spots.reject {|a| a[:formatted_phone_number].nil?}
      puts hasnum
      spots.each do |spot|
        puts spot[:formatted_phone_number]
        puts spot.formatted_phone_number
        puts spot.name
        puts spot[:name]
      end
      #puts spots[:formatted_phone_number]
      #puts @client.spot(spots[0].)
      puts 'okay'
    end
  end
end
