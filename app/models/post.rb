class Post < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: {minimum: 1, maximum: 300}, allow_blank: false
  
  has_attached_file :image, styles: {medium: "1000x500"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  scope :following, -> (following_users) {where user_id: following_users}
end
