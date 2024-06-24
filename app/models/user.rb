class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :smoking_data, dependent: :destroy
  accepts_nested_attributes_for :smoking_data

  attr_accessor :send_reminder_email

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true  # 一意性のバリデーションを追加
  validates :start_date, presence: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def self.send_reminder_emails
    all.each do |user|
      ReminderMailer.send_reminder_email(user).deliver_now
    end
  end

  def update_with_smoking_data(params)
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    update(params[:user]) && smoking_data.update(params[:user][:smoking_data_attributes])
  end
end
