class ServiceRecordsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @record = current_user.service_records
    end

    def new 
        @record = ServiceRecord.new 
    end

    def create 
        @record = current_user.service_records.build(service_params)
        if @record.save 
            flash[:message] = "Service Record Created Succesfully!"
            redirect_to service_record_path(@record)
        else 
            flash[:message] = "There Was An Error, Please Try Again Later"
            render :new
        end
    end

    def update 
        @record = current_user.service_records.find_by_id([:id])
        @record.update(service_params)
        redirect_to service_record_path
    end

    def destroy
        @record = current_user.service_records.find_by_id(params[:id])
        @record.destroy 
        redirect to new_service_record_path
    end

    private 
    def service_params
        params.require(:service_records).permit(:name, :date, :cost, :notes, :userbike_id)
    end
end
