class SmokingData < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :cigarettes_per_day, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_pack, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def cigarettes_not_smoked
    return 0 unless cigarettes_per_day && user.start_date

    smoke_free_days = (Time.zone.now.to_date - user.start_date.to_date).to_i
    smoke_free_days * cigarettes_per_day
  end

  def days_without_smoking
    return 0 unless start_date

    (Time.zone.now.to_date - start_date.to_date).to_i
  end

  def money_saved
    return 0 unless start_date && cigarettes_per_day && price_per_pack

    cigarettes_not_smoked * (price_per_pack / 20.0)  # Assuming 1 pack = 20 cigarettes
  end
end
