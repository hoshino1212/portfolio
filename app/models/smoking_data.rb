class SmokingData < ApplicationRecord
    belongs_to :user
  
    validates :start_date, presence: true
    validates :cigarettes_per_day, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :price_per_pack, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  
  