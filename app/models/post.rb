class Post < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :description, :presence => true

  belongs_to :user
  has_many :comments

  default_scope { order('created_at DESC') }

  paginates_per 5
end
