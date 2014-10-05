require 'net/http'
require 'uri'
require 'opentable_client'

class PagesController < ApplicationController
  def main
    get_result
  end
=begin
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
=end

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
    api = OpenTable::Client.new
    resp = api.restaurants(:city => "Chicago")

    puts resp

    render 'get_result'
  end
end
