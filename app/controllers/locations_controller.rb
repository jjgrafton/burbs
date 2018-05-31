class LocationsController < ApplicationController

    def show
        xml = HTTParty.get("https://api.greatschools.org/schools/nearby?key=d0bc7eeb56cba7074d643b67a977c968&state=ny&zip=10024&radius=5&limit=5")

        hash = Hash.from_xml(xml.body)

        @helper = hash["schools"]["school"]



        
        # @schools.each do |school|

        # end
    end
    
end
