class LocationsController < ApplicationController

    def show
        #pull data from Great Schools API using a zipcode
        xml = HTTParty.get("https://api.greatschools.org/schools/nearby?key=d0bc7eeb56cba7074d643b67a977c968&state=ny&zip=10024&radius=5&limit=5")

        hash = Hash.from_xml(xml.body)

        @helper = hash["schools"]["school"]

        # GOOGLE MAPS API
        require 'google_maps_service'

        # Setup global parameters
        GoogleMapsService.configure do |config|
        config.key = ENV['GOOGLE_MAPS_API_KEY_JAMIE']
        config.retry_timeout = 50
        config.queries_per_second = 20

         # Initialize client using global parameters
        gmaps = GoogleMapsService::Client.new
    end

    end
    
end

#{params[:zip]}
