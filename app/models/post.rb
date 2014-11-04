class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :region

  has_many :category_tags
  has_many :categories, through: :category_tags
end
