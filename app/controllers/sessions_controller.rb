class SessionsController < ApplicationController
    def new
        @user = User.find_by_id(params[:id])
    end
end
