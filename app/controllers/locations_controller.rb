class LocationsController < ApplicationController
        before_action :authenticate_user!

    require 'json'

    def show
        
        @current_user = current_user
        #pull data from Great Schools API using a zipcode
        xml = HTTParty.get("https://api.greatschools.org/schools/nearby?key=d0bc7eeb56cba7074d643b67a977c968&state=ny&zip=#{params[:zip]}&radius=5&limit=5")

        hash = Hash.from_xml(xml.body)

        @helper = hash["schools"]["school"]
        # pp @helper 

        # GOOGLE MAPS API

        #UNTIL A BETTER TRANSPORTATION API CAN BE USED, THIS IS A HARD CODE WORK AROUND TO PASS INFO INTO THE VERY LIMITED GOOGLE MAPS DIRECTIONS API

        @zip = params[:zip]

        if @zip === "10705"
                @place_id = "place_id:ChIJlybmFmnywokRyL6hUK9g9OM"
                @place_name = "Ludlow"
                @foursquare = "ludlow,ny"
                @bing = "40.9281544,-73.9009692"
                
        elsif @zip === "10701"
                @place_id = "place_id:ChIJ_UMCtnDywokRH7B_1XIxOrw" 
                @place_name = "Yonkers, Glenwood & Greystone"
                @foursquare = "yonkers,ny" 
        elsif @zip === "10706"
                @place_id = "place_id:ChIJq6qqqu7swokRHV5A9O9i9VY"
                @place_name = "Hastings-on-Hudson"
                @foursquare = "hastings-on-hudson,ny"
        elsif @zip === "10522"
                @place_id = "place_id:ChIJDzJecoPswokR3K88ZtUA3BQ"
                @place_name = "Dobbs Ferry"
                @foursquare = "dobbs-ferry,ny"
        elsif @zip === "10503"
                @place_id = "place_id:ChIJo1uL-m_rwokRtEI1Kzk-Csw"
                @place_name = "Ardsley-on-Hudson"
                @foursquare = "ardsley-on-hudson,ny"
        elsif @zip === "10533"
                @place_id = "place_id:ChIJxSxJ-jzrwokR1Tj-oGhA4h8"
                @place_name = "Irvington"
                @foursquare = "irvington,ny"
        elsif @zip === "10591"
                @place_id = "place_id:ChIJud0-Lr7qwokREHus8NEDiBI"
                @place_name = "Tarrytown & Philipse Manor"
                @foursquare = "tarrytown,ny"
        elsif @zip === "10510"
                @place_id = "place_id:ChIJ1e8DDovAwokRTM2dUmYTwBI"
                @place_name = "Scarborough"
                @foursquare = "scarborough,ny"
        elsif @zip === "10562"
                @place_id = "place_id:ChIJwbBXzsbAwokRKys2vmZUKoU"
                @place_name = "Ossining"
                @foursquare = "ossining,ny"
        elsif @zip === "10520"
                @place_id = "place_id:ChIJ5dwd2iPHwokRETICF3Y2p4U"
                @place_name = "Croton-Harmon"
                @foursquare = "croton-harmon,ny"
        elsif @zip === "10548"
                @place_id = "place_id:ChIJLbM8VBDGwokRlM_iJiJbExM"
                @place_name = "Cortlandt"
                @foursquare = "cortlandt,ny"
        elsif @zip === "10566"
                @place_id = "place_id:ChIJlQF8JMzIwokREnhOAuXMQ7c"
                @place_name = "Peekskill"
                @foursquare = "peekskill,ny"
        elsif @zip === "10524"
                @place_id = "place_id:ChIJ7dxOwpnOwokR78PxkmzbDRI"
                @place_name = "Garrison & Manitou"
                @foursquare = "garrison,ny"
        elsif @zip === "10516"
                @place_id = "place_id:ChIJ36U0gsrMwokRBDuP6vfNOzs"
                @place_name = "Cold Spring"
                @foursquare = "cold-spring,ny"
        elsif @zip === "12508"
                @place_id = "place_id: ChIJTc7w8p8z3YkRkEQmuhvlIdY"
                @place_name = "Beacon & Breakneck Ridge"
                @foursquare = "beacon,ny"
        elsif @zip === "12590"
                @place_id = "place_id:ChIJj10ugRk63YkRNQjLkA07eqE"
                @place_name = "New Hamburg"
                @foursquare = "new-hamburg,ny"
        elsif @zip === "12601"
                @place_id = "place_id:ChIJPUcaod893YkRGvHemUKoEzE"
                @place_name = "Poughkeepsie"
                @foursquare = "poughkeepsie,ny"
        end
        
        puts ">>>>"
        puts @place_id
        puts @place_name
        puts @foursquare
        puts @train
        puts ">>>>"


        @train = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@place_id}&destination=place_id:ChIJhRwB-yFawokRi0AhGH87UTc&mode=transit&key=AIzaSyD6LM1YiZNO8S1FixZXf9hKfAP2KS-V2w4")

        @driving = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@place_id}&destination=place_id:ChIJhRwB-yFawokRi0AhGH87UTc&key=AIzaSyD6LM1YiZNO8S1FixZXf9hKfAP2KS-V2w4")

        @coffee = HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=#{@foursquare}&query=coffee&limit=5&v=20150214&m=foursquare&client_secret=NQVC1IA4AD1AMCITCJU3LCDWSZIC04WRUDCWV3LSAZ10Y3QD&client_id=AZDSZKJAU3FCSY3Z5BFIGEZUCIMLKFYOZSQ5UECV5UVHVBJO")

        @daycare = HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=#{@foursquare}&query=daycare&limit=5&v=20150214&m=foursquare&client_secret=NQVC1IA4AD1AMCITCJU3LCDWSZIC04WRUDCWV3LSAZ10Y3QD&client_id=AZDSZKJAU3FCSY3Z5BFIGEZUCIMLKFYOZSQ5UECV5UVHVBJO")

        @playgrounds = HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=#{@foursquare}&query=playgrounds&limit=5&v=20150214&m=foursquare&client_secret=NQVC1IA4AD1AMCITCJU3LCDWSZIC04WRUDCWV3LSAZ10Y3QD&client_id=AZDSZKJAU3FCSY3Z5BFIGEZUCIMLKFYOZSQ5UECV5UVHVBJO")

        @supermarket = HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=#{@foursquare}&query=supermarkets&limit=5&v=20150214&m=foursquare&client_secret=NQVC1IA4AD1AMCITCJU3LCDWSZIC04WRUDCWV3LSAZ10Y3QD&client_id=AZDSZKJAU3FCSY3Z5BFIGEZUCIMLKFYOZSQ5UECV5UVHVBJO")

        @map = "https://dev.virtualearth.net/REST/V1/Imagery/Map/Road/#{@zip}/13?mapSize=600,400&format=png&key=AulEaUqqAg-LYiZz4uWArSu2KhSTpFvdeHevugs5Mle7Bw7Es0FWWAe3zpRHx8ds"



        

        
    end
    
end



#{params[:zip]}
