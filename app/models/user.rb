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

###############################
has_many :messages
has_many :subscriptions
has_many :chats, through: :subscriptions

def existing_chats_users
  existing_chat_users = []
  self.chats.each do |chat|
    existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
  end
  existing_chat_users.uniq
end

def full_name
  "#{first_name.capitalize} #{last_name.capitalize}"
end
end
