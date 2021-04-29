class SessionsController < ApplicationController
    def new
      @user = User.find_by_id(params[:id])
    end

    def create
        binding.irb
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:username])
            flash[:message] = "Welcome Back!"
            session[:user_id] = @user.id
            redirect_to bikes_path
        else
            flash[:message] = @user.errors.full_messages
            redirect_to login_path
        end
    end
    
    def logout
        session.clear
        redirect_to login_path
    end

   
end
