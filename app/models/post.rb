class Post < ApplicationRecord
  belongs_to :user
  belongs_to :orid

  validates :content, presence: true
end
