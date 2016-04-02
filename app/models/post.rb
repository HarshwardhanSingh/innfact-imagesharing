class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :category
  acts_as_likeable

  has_attached_file :image, styles: { medium: "550x550>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end