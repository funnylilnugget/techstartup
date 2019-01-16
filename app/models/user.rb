class User < ApplicationRecord
has_secure_password
validates :first_name, :last_name, :username, :email, presence: true
validates :premium, default: false
has_many :posts, dependent: :destroy
belongs_to :location, optional: true
has_one_attached :picture

def full_name
  "#{first_name.capitalize} #{last_name.capitalize}"
end
end
