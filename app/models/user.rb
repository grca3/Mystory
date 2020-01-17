class User < ApplicationRecord
  
has_many :posts, dependent: :destroy

  validates :name, {presence: true, length:{maximum:20}, uniqueness: true}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true}
  
  validates :password, {presence: true, length: { in: 4..8 }, numericality: {only_integer: true}}
  
end
