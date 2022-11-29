class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @songs = current_user.songs.order("created_at DESC")
  end
end
