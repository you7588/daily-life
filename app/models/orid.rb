class Orid < ApplicationRecord
  validates :title, presence: true

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  belongs_to :user
  has_many :posts

  scope :only_public, -> { where( :status => "public" ) }
  scope :only_available, -> { where( :status => ["public", "private"] ) }

  def to_param
      "#{self.id}-#{self.title}"
  end
end
