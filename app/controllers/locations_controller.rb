class LocationsController < ApplicationController
    before_action :authenticate_user!

    def show
        @towns = HTTParty.get("https://api.greatschools.org/schools/nearby?key=d0bc7eeb56cba7074d643b67a977c968&zip=#{params[:zip]}&radius=5&limit=10")
    end
    
end
