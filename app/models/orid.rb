class Orid < ApplicationRecord
  validates :title, presence: true

  def to_param
      "#{self.id}-#{self.title}-#{self.date}"
  end
end
