class User < ApplicationRecord
    has_many :owned_bikes, class: "Bike", foreign_key: "user_id", dependent: :destroy
    has_many :service_records
    has_many :bikes, through: :service_records 
   # has_many :transfers, through: :bikes
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    def new
       @user = User.new
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
