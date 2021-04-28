class SessionsController < ApplicationController
    def new
        @user = User.find_by_id(params[:id])
    end

    def create
        @user = User.find_by_username(user: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Welcome Back!"
            session[:user_id] = @user.id
            redirect_to # landing page
        else
            flash[:message] = "Login Attempt Failed, Check Credentials"
            redirect_to login_path
        end
    end
    
    def logout
        session.clear
        redirect_to login_path
    end
end
