class Post < ApplicationRecord
validates :name, :description, presence: true
validates :premium, default: false
belongs_to :user
belongs_to :category
has_one_attached :picture
end
