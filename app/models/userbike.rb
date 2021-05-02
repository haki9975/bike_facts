class Userbike < ApplicationRecord
    belongs_to :user 
    has_many :service_records
    belongs_to :bike 
    validates :name, presence: true
    validates :serial_number, presence: true 
    validates :notes, presence: true

end
