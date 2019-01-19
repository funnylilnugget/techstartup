require 'securerandom'
class ChatsController < ApplicationController
  before_action :require_login

  def index
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  def create
    @other_user = User.find(params[:other_user])
    @post = Post.find_by_id(params[:post])
    @chat = find_chat(@other_user, @post) || Chat.new(identifier: SecureRandom.hex)
    @chat.post = @post
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat, :other_user => @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    @post = Post.find_by_id(@chat.post_id)
    @message = Message.new
  end

private

  def find_chat(second_user, post)
    chats = current_user.chats
    chats.each do |chat|
      if chat.post_id == @post.id
        chat.subscriptions.each do |s|
          if s.user_id == second_user.id
            return chat
          end
        end
      end
    end
    nil
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end

end
