class User < ApplicationRecord
    has_secure_password
   # has_many :owned_bikes, :class "Bike", foreign_key: "user_id", dependent: :destroy
    has_many :service_records
    has_many :bikes, through: :service_records 
   # has_many :transfers, through: :bikes
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
 
end
