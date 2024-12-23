class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_picture
  has_many :pets
  has_many :appointments

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "can only contain letters and numbers" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, 
                       format: { with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+~`|{}\[\]:;"'<>,.?\/-]+\z/, 
                       message: "must include both letters, numbers, at least one capital letter, and can include special characters" },  
                       allow_nil: true
  # validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
end
