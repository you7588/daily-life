class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orids
  has_many :posts
  has_many :feedbacks
  has_many :likes, :dependent => :destroy
  has_many :liked_feedbacks, :through => :likes, :source => :feedback
  has_one :profile

  def display_name
    self.email.split("@").first
  end

  def admin?
    is_admin
  end
end
