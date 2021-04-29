class UsersController < ApplicationController
    def new
        @user = User.new
    end
     
     def create
        #binding.irb
        @user = User.new(user_params)
        
        if @user.save
            flash[:message] = "Congratulations, You Have Registered!"
            session[:id] = @user.id 
            redirect_to bikes_path
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:id, :name, :username, :password, :email)
    end
end
