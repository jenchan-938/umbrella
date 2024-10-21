require "dotenv/load"
require "http"
require "json"

pirate=ENV.fetch("PIRATE_WEATHER_KEY")
gmaps=ENV.fetch ("GMAPS_KEY")
pp gmaps

pp "What location do you want to know the temperature of?"
location_r = gets.chomp

google_url= "https://maps.googleapis.com/maps/api/geocode/json?address=#{location_r}&key=#{gmaps}"
#retrieve API >> give it the users location and get the information 

raw_response = HTTP.get(google_url)
parsed_response = JSON.parse(raw_response)

#parsed_response.class
#parsed_response.keys

results= parsed_response.fetch("results")
address=results.at(0)
location=address.fetch("geometry").fetch("location")
lat = location.fetch("lat")
lng = location.fetch("lng")
pp "Your coordinates are lat: #{lat} and lng: #{lng}"

weather_url = "https://api.pirateweather.net/forecast/#{pirate}/#{lat},#{lng}"
weather_response= HTTP.get(weather_url)
parsed_weather_response= JSON.parse(weather_response)

#parsed_weather_response.class
#parsed_weather_response.keys

temp = parsed_weather_response.fetch("currently").fetch("temperature")
summary = parsed_weather_response.fetch("currently").fetch("summary")

pp "At #{location_r}, it is currently #{temp} degrees and overall it is #{summary}"
