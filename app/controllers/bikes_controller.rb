class BikesController < ApplicationController
    before_action :redirect_if_not_logged_in
  
    def index
        @bikes = current_user.bikes
        redirect_to bikes_path(@bikes)
    end

    def new 
        @bike = current_user.bikes
    end

    def create 
        @bike.save
        if @bike.save
          flash[:message] = "Bike Information Saved!"
          redirect_to bike_path(@bike)
        else
          flash[:message] = "Bike Information Could Not Be Saved, Check Parameters."
          redirect_to new_bike_path
        end
    end


    def show
        @bike = Bike.find_by_id(params[:id])
    end

    def update 
        @bike = Bike.find_by_id(params[:id])
        @bike.update_attribues(params[:bikes])
        redirect_to bike_path(@bike)
    end

    def destroy
        @bike = Bike.find_by_id(params[:id])
        @bike.destroy
        redirect_to
    end




    private
     def bike_params
        params.require (:bike).permit(:id, :name, :description, :serial_number)
     end


end
