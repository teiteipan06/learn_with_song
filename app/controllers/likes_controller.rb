class LikesController < ApplicationController
  
  def new
    @likes = Like.all
  end

  def create
    @song_like = Like.new(user_id: current_user.id, song_id: params[:song_id])
    @song_like.save
    redirect_to song_path(params[:song_id]) 
  end


  def destroy
    @song_like = Like.find_by(user_id: current_user.id, song_id: params[:song_id])
    @song_like.destroy
    redirect_to song_path(params[:song_id]) 
  end
end
