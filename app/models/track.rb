class Track < ActiveRecord::Base
  belongs_to :user
  has_many   :upvotes
  validates :title, presence: true, length: { maximum: 100 }
end