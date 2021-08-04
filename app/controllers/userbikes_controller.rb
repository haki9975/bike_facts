class UserbikesController < ApplicationController
    before_action :redirect_if_not_logged_in
  
    def index
        @ubikes = current_user.userbikes
    end

    def new         
        @bike = Userbike.new
    end

    def create 
        @bike =current_user.userbikes.build(userbike_params)        
        if @bike.save
          flash[:message] = "Bike Information Saved!"
          redirect_to userbike_path(@bike)
        else
          flash[:message] = "Bike Information Could Not Be Saved, Check Parameters."
          render :new 
        end
    end

    def show
        redirect_if_ubikes_not_authorized
        @bike = find_userbike
        if @bike != nil 
          @record = @bike.service_records
        end
    end

    def edit 
        redirect_if_ubikes_not_authorized
        @bike = find_userbike
    end

    def update 
        redirect_if_ubikes_not_authorized
        @bike = find_userbike
        @bike.update(userbike_params)
        redirect_to userbike_path(@bike)
    end

    def destroy
        redirect_if_ubikes_not_authorized
        @userbike = find_userbike
        @userbike.destroy
        redirect_to userbikes_path
    end

    private
     def userbike_params
        params.require(:userbike).permit(:id, :name, :notes, :user_id, :bike_id, :serial_number, service_record_attributes: [:name, :date, :cost, :notes])
     end
     
     def redirect_if_ubikes_not_authorized
        auth = current_user.userbikes.pluck(:id).include? params[:id].to_i
        if !auth 
            redirect_to userbikes_path
        end
     end
    
     def find_userbike
        Userbike.find_by_id(params[:id])
    end
end
