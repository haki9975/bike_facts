class Bike < ApplicationRecord
    has_many :userbikes
    has_many :users, through: :userbikes 
    validates :brand, presence: true, uniqueness: true
        
end
