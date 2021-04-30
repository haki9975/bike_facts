class Bike < ApplicationRecord
    has_many :users, through: :userbikes 
    
end
