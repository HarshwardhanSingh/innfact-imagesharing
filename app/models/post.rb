class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  acts_as_likeable

  has_attached_file :image, styles: { medium: "550x550>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :category_id, presence: true
  validates :content, presence: true
  validates :image, presence: true
end
