class LocationsController < ApplicationController

  def manhattan
    users = User.where("location_id = 1")
    if users.count == 0
      render 'error'
    else
      users.each do |user|
        if user.posts.count == 0
          render 'error'
        else
          @posts = user.posts
        end
      end
    end
  end

  def brooklyn
    users = User.where("location_id = 2")
    if users.count == 0
      render 'error'
    else
      users.each do |user|
        if user.posts.count == 0
          render 'error'
        else
          @posts = user.posts
        end
      end
    end
  end

  def queens
    users = User.where("location_id = 3")
    if users.count == 0
      render 'error'
    else
      users.each do |user|
        if user.posts.count == 0
          render 'error'
        else
          @posts = user.posts
        end
      end
    end
  end

  def the_bronx
    users = User.where("location_id = 4")
    if users.count == 0
      render 'error'
    else
      users.each do |user|
        if user.posts.count == 0
          render 'error'
        else
          @posts = user.posts
        end
      end
    end
  end

  def staten_island
    users = User.where("location_id = 5")
    if users.count == 0
      render 'error'
    else
      users.each do |user|
        if user.posts.count == 0
          render 'error'
        else
          @posts = user.posts
        end
      end
    end
  end

end
