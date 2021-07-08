class User < ApplicationRecord
    has_secure_password
   
    has_many :service_records
    has_many :userbikes
    has_many :bikes, through: :userbikes 
   
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

end
