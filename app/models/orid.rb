class Orid < ApplicationRecord
  validates :title, presence: true

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  belongs_to :user
  has_many :posts

  scope :only_public, -> { where( :status => "public" ) }
  scope :only_available, -> { where( :status => ["public", "private"] ) }

  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  def to_param
      "#{self.id}-#{self.title}"
  end
end
