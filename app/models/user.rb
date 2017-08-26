class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :orids
  has_many :posts
  has_many :feedbacks
  has_many :likes, :dependent => :destroy
  has_many :liked_feedbacks, :through => :likes, :source => :feedback
  has_one :profile
    accepts_nested_attributes_for :profile

  def display_name
    if self.name.present?
      self.name
    else
    self.email.split("@").first
  end
  end

  def admin?
    is_admin
  end
end
