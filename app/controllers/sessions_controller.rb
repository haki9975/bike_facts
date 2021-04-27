class SessionsController < ApplicationController
    def new
        @user = User.find_by_id(params[:id])
    end

    def create
        @user = User.find_by_username(user: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Welcome Back!"
            session[:user_id] = @user.id
            redirect # landing page
        else
            flash[:]
            redirect login_path
        end
    end
end
