class SessionsController < ApplicationController
    def new
      @user = User.find_by_id(params[:id])
    end

    def create
                @user = User.find_by_username(user_params[:username])
        if @user && @user.authenticate(user_params[:password_digest])
            flash[:message] = "Welcome Back!"
            session[:user_id] = @user.id
            redirect_to bikes_path
        else
            flash[:message] = "Login Attempt Failed, Check Credentials"
           # redirect_to login_path
        end
    end
    
    def logout
        session.clear
        redirect_to login_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password_digest, :email)
     end
end
