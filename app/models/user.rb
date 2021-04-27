class User < ApplicationRecord
    has_many :bikes, dependent: :destroy
    has_many :service_records, through: :bikes 
    has_many :transfers, through: :bikes
    has_secure_password
    validates :email, uniqueness: true
    def new
        User.new
    end

    def create
        @user = User.find_by_id[:user_params]
        if @user.save
            flash[:message] = "Congratulations, You Have Registered!"
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
