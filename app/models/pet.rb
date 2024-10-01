class Pet < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :owner
  has_many :appointments

  #Active Storage for image handling
  has_one_attached :image

  #Validations
  validates :name, presence: true
  validates :breed, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
end
