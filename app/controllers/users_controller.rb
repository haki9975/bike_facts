class UsersController < ApplicationController
    def new
        @user = User.new
        redirect_to signup_path
     end
     
     def create
        @user = User.find_by_id[:user_params]
        if @user.save
            flash[:message] = "Congratulations, You Have Registered!"
            session[:id] = @user.id 
            #redirect to landing page
        else
            render :new 
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end
end
