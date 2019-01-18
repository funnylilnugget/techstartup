class User < ApplicationRecord
has_secure_password


validates :first_name, :last_name, presence: true
validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
validates :username, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
validates :password, presence: true, confirmation: true, length: { minimum: 6 }

validates :premium, default: false




has_many :posts, dependent: :destroy
belongs_to :location, optional: true
has_one_attached :picture

def full_name
  "#{first_name.capitalize} #{last_name.capitalize}"
end
end
