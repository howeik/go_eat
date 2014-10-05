require 'net/http'
require 'uri'
require 'opentable_client'
require 'googleplaces_client'

class PagesController < ApplicationController
  def main
    unless params.key? 'lat'
      get_location
      return
    end

    unless params.key? 'num_people'
      get_num_people
      return
    end

    unless params.key? 'budget'
      get_budget
      return
    end

    get_result
  end

  def get_location
    render 'get_location'
  end

  def get_num_people
    render 'get_num_people'
  end

  def get_budget
    render 'get_budget'
  end

  def get_result
=begin
    api = OpenTable::Client.new
    resp = api.restaurants(:city => "Chicago")

    # Process response
    puts 'hi we here'
    puts resp['total_entries']       # => records found
    puts 'hi we done'
    resp['restaurants'] # => restaurant records
=end


    #Geocoder.search("37.8705675,-122.2518025")[0].postal_code
    zip = Geocoder.search("#{params[:lat]},#{params[:lon]}")[0].postal_code

    api = OpenTable::Client.new
    resp = api.restaurants(:zip => "#{zip}")
    #resp = api.restaurants(:postal_code => "94709")
    num_entries = resp["total_entries"]
    rand_entry = Random.new.rand(0..(num_entries-1))
    restaurant = resp["restaurants"][rand_entry]

    @r_name = restaurant["name"]
    @r_address = restaurant["address"]
    @r_city = restaurant["city"]
    @r_state = restaurant["state"]
    @r_area = restaurant["area"]
    @r_country = restaurant["country"]
    @r_reserve_url = restaurant["reserve_url"]
    @r_mobile_reserve_url = restaurant["mobile_reserve_url"]

    #puts @r_name
    #puts @r_address
    #puts @r_city
    #puts @r_reserve_url

    #puts restaurant

    #puts num_entries
    #puts rand_entry

    #puts resp[:restaurants]
    #puts resp
    #puts resp["restaurants"]
    #puts resp["restaurants"][0]


    ##gapi = GPlaceHelper::Client.new
    
    # browser key doesn't work
    #gresp = gapi.places('AIzaSyAQy4pRQ0o2jqKMFXTCQI1c92Cjxu_E5qg', params[:lat], params[:lon])

    # server key does
    #gresp = gapi.places('AIzaSyDVV5xj1gN7Fvx4dREuq5LXu3Q8jxho9Mg', params[:lat], params[:lon])

    #puts place
    #puts resp

    render 'get_result'
  end
end
