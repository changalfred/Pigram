class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: {minimum: 1, maximum: 300}, allow_blank: false
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_attached_file :image, styles: {:medium => "640x"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
