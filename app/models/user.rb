class User < ApplicationRecord
has_secure_password
validates :first_name, :last_name, :username, :email, presence: true
validates :premium, default: false
has_many :posts
belongs_to :location, optional: true
has_one_attached :picture

def full_name
  "#{first_name} #{last_name}"
end
end
