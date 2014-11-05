class Category < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :region

  has_many :category_tags
  has_many :posts, through: :category_tags
end
