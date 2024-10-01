class Owner < ApplicationRecord
  #Associations
  has_many :pets, dependent: :destroy

  #Validations
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, presence: true
end
