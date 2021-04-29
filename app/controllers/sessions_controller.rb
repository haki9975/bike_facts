class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:omniauth]
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
            render :new
        end
    end
    
    def logout
        session.clear
        redirect_to login_path
    end

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.name = auth[:info][:name]
            u.uid = auth[:info][:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end

        if @user.valid?
            flash[:message] = "Signed in with Google"
            session[:user_id] = @user.id 
            redirect_to bikes_path
        else 
            flash[:message] = "Could Not Login, Please Check Credentials"
            redirect_to login_path
        end
    end

    private 
    def auth
      request.env['omniauth.auth']
    end
end
