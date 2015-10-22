class User < ActiveRecord::Base
  has_many :tracks
  has_many :upvotes
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end