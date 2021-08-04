class ServiceRecordsController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_not_authorized

    
    def index
      @userbike = Userbike.find_by_id(params[:userbike_id])
       if @userbike
             @records = @userbike.service_records
             @mostex = @userbike.service_records.expensiverecord
       else
            @records = current_user.service_records
            @mostex = current_user.service_records.expensiverecord
       end
    end

    def new 
        if @userbike
            @records = @userbike.service_records.build
        else
             @records = ServiceRecord.new 
        end
    end

    def create 
        @records = current_user.service_records.build(service_params)
        if @records.save 
            flash[:message] = "Service Record Created Succesfully!"
            redirect_to service_record_path(@records)
        else 
            flash[:message] = "There Was An Error, Please Try Again Later"
            render :new
        end
    end

    def edit
        @records = find_service
    end

    def update 
        @records = find_service
    end

    def show
       @records = find_service
       @userbike = @records.userbike
       
    end

    def destroy
        @records = find_service
        @records.destroy 
        redirect_to userbikes_path
    end

    private 
    def service_params
        params.require(:service_record).permit(:name, :date, :cost, :notes, :userbike_id, userbike_attributes: [:id, :name, :serial_number, :notes])
    end

    def find_service
        ServiceRecord.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
      auth = current_user.userbikes.pluck(:id).include? params[:userbike_id].to_i
        if !auth 
            redirect_to userbikes_path
        end
     end
end
