class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  belongs_to :post, optional: true
  validates :identifier, presence: true, uniqueness: true, case_sensitive: false
end
