class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :smoking_data, dependent: :destroy
  accepts_nested_attributes_for :smoking_data

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true  # 一意性のバリデーションを追加

  validates :reminder_time, presence: true
  validates :start_date, presence: true
end
