class Userbike < ApplicationRecord
    belongs_to :user 
    has_many :service_records
    belongs_to :bike 
end
