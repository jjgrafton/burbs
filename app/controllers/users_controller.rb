class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user
       #display user profile
       #display form to choose location        
    end
end
