class Bike < ApplicationRecord
    belongs_to :user
    has_many :service_records
    has_many :transfers
end