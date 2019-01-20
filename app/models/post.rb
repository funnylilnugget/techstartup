class Post < ApplicationRecord
  belongs_to :user, optional: true
  # has_many :chats
  belongs_to :category, optional: true
  has_one_attached :picture
  validates :name, :description, :tags, presence: true
  validates_length_of :name, :maximum => 20
  validates :tags, format: {with: /\A#[a-z]/}
  validates :premium, default: false
end
