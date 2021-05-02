class ServiceRecord < ApplicationRecord
    belongs_to :userbike
    belongs_to :user 
    scope :expensiverecord, -> { where("cost > 50") }
    validates :name, presence: true
    validates :cost, presence: true 
    validates :date, presence: true
    validates :notes, presence: true
    
end
