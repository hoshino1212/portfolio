class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :smoking_data, class_name: 'SmokingData', dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  # 追加されたバリデーション
  validates :reminder_time, presence: true
  validates :start_date, presence: true
end
