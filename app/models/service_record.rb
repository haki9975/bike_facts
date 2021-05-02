class ServiceRecord < ApplicationRecord
    belongs_to :userbike
    belongs_to :user 
    scope :expensiverecord, -> { where("cost > 50") }
    
end
