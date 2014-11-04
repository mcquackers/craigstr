class Category < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :region
end
