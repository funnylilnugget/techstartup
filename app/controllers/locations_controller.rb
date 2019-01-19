class LocationsController < ApplicationController

  def manhattan
    users = User.where("location_id = 1")
    users.each do |user|
      @posts = user.posts
    end

  end

  def brooklyn
    users = User.where("location_id = 2")
    users.each do |user|
      @posts = user.posts
    end
  end

  def queens
    users = User.where("location_id = 3")
    users.each do |user|
      @posts = user.posts
    end
  end

  def the_bronx
    users = User.where("location_id = 4")
    users.each do |user|
      @posts = user.posts
    end
  end

  def staten_island
    users = User.where("location_id = 5")
    users.each do |user|
      @posts = user.posts
    end
  end
end
