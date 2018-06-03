class LocationsController < ApplicationController

    def show
        #pull data from Great Schools API using a zipcode
        xml = HTTParty.get("https://api.greatschools.org/schools/nearby?key=d0bc7eeb56cba7074d643b67a977c968&state=ny&zip=#{params[:zip]}&radius=5&limit=5")

        hash = Hash.from_xml(xml.body)

        @helper = hash["schools"]["school"]
        # pp @helper 

        # GOOGLE MAPS API

        #UNTIL A BETTER TRANSPORTATION API CAN BE USED, THIS IS A HARD CODE WORK AROUND TO PASS INFO INTO THE VERY LIMITED GOOGLE MAPS DIRECTIONS API

        # @zip = params[:zip]

        if @zip = "10705"
                @place_id = "place_id:ChIJlybmFmnywokRyL6hUK9g9OM"
        elsif @zip = "10701"
                @place_id = "place_id:ChIJ_UMCtnDywokRH7B_1XIxOrw"
        elsif @zip = "10706"
                @place_id = "place_id:ChIJq6qqqu7swokRHV5A9O9i9VY"
        elsif @zip = "10522"
                @place_id = "place_id:ChIJDzJecoPswokR3K88ZtUA3BQ"
        elsif @zip = "10503"
                @place_id = "place_id:ChIJo1uL-m_rwokRtEI1Kzk-Csw"
        elsif @zip = "10533"
                @place_id = "place_id:ChIJxSxJ-jzrwokR1Tj-oGhA4h8"
        elsif @zip = "10591"
                @place_id = "place_id:ChIJud0-Lr7qwokREHus8NEDiBI"
        elsif @zip = "10510"
                @place_id = "place_id:ChIJ1e8DDovAwokRTM2dUmYTwBI"
        elsif @zip = "10562"
                @place_id = "place_id:ChIJwbBXzsbAwokRKys2vmZUKoU"
        elsif @zip = "10520"
                @place_id = "place_id:ChIJ5dwd2iPHwokRETICF3Y2p4U"
        elsif @zip = "10548"
                @place_id = "place_id:ChIJLbM8VBDGwokRlM_iJiJbExM"
        elsif @zip = "10566"
                @place_id = "place_id:ChIJlQF8JMzIwokREnhOAuXMQ7c"
        elsif @zip = "10524"
                @place_id = "place_id:ChIJ7dxOwpnOwokR78PxkmzbDRI"
        elsif @zip = "10516"
                @place_id = "place_id:ChIJ36U0gsrMwokRBDuP6vfNOzs"
        elsif @zip = "12508"
                @place_id = "place_id: ChIJTc7w8p8z3YkRkEQmuhvlIdY"
        elsif @zip = "12590"
                @place_id = "place_id:ChIJj10ugRk63YkRNQjLkA07eqE"
        elsif @zip = "12601"
                @place_id = "place_id:ChIJPUcaod893YkRGvHemUKoEzE"
        end
        
        @train = HTTParty.get("https://maps.googleapis.com/maps/api/directions/JSON?origin=#{@place_id}&destination=place_id:ChIJhRwB-yFawokRi0AhGH87UTc&transit_mode=rail&key=AIzaSyD6LM1YiZNO8S1FixZXf9hKfAP2KS-V2w4")

        @driving = HTTParty.get("https://maps.googleapis.com/maps/api/directions/JSON?#{@place_id}&destination=place_id:ChIJhRwB-yFawokRi0AhGH87UTc&mode=driving&key=AIzaSyD6LM1YiZNO8S1FixZXf9hKfAP2KS-V2w4")
    end
    
end

#{params[:zip]}
