class Userbike < ApplicationRecord
    belongs_to :user 
    has_many :service_records, dependent: :destroy
    belongs_to :bike 
    validates :name, presence: true
    validates :serial_number, presence: true, uniqueness: true
    validates :notes, presence: true

end
