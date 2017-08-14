class Orid < ApplicationRecord
  validates :title, presence: true

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  belongs_to :user
  has_many :posts

  def to_param
      "#{self.id}-#{self.title}-#{self.date}"
  end
end