class Post < ApplicationRecord
validates :name, :description, presence: true
validates :premium, default: false
belongs_to :user, optional: true
belongs_to :category, optional: true
has_one_attached :picture
end
