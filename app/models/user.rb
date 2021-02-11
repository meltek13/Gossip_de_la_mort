class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :age, 
  presence: true,
  numericality: {only_integer: true, greater_than: 0}
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes, dependent: :destroy
  
end
