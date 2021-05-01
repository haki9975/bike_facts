class BikesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @bikes = Bike.new
    end

    def create  
        @bikes= Bike.new(bike_params)
        
        if @bikes.save
            redirect_to bikes_path
        else
            flash[:message] = "Sorry, bike brand could not be saved."
            redirect_to bikes_path
        end
    end

    def index
        @bikes = Bike.all.map {|b| b.brand}
    end

    private

    def bike_params
        params.require(:bike).permit(:id, :brand, :user_id)
    end
    
    

end
