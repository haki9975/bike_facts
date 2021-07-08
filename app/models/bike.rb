class Bike < ApplicationRecord
    has_many :userbikes
    has_many :users, through: :userbikes 
    validates :brand, presence: true, uniqueness: true
    scope :bikequery, -> (search) { where('brand LIKE ?', "%#{search}%")}
        
end
