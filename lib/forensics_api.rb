require 'httparty'

class Forensics_api

attr_reader :api_url

  def initialize(api_url = "http://which-technical-exercise.herokuapp.com/api/mrands@hotmail.co.uk/directions")
    @api_url = api_url
  end

  def retrieve_directions
    response = HTTParty.get(@api_url)
    response.parsed_response["directions"]
  end
end 
