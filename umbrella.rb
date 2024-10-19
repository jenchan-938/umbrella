require "dotenv/load"
require "http"
require "json"

ENV.fetch("PIRATE_WEATHER_KEY")
gmaps=ENV.fetch ("GMAPS_KEY")
pp gmaps

pp "What location do you want to know the temperature of?"
location = gets.chomp

google_url= "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{gmaps}"
#retrieve API >> give it the users location and get the information 

raw_response = HTTP.get(google_url)
parsed_response = JSON.parse(raw_response)

pp parsed_response.class
pp parsed_response.keys

pp parsed_response
results= parsed_response[0]
pp results

#fetch("results").fetch("address_components").fetch("geometry").fetch("location") ; fetch one thing at a time
