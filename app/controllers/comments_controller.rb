class CommentsController < ApplicationController

  def create
    @song = Song.find(params[:song_id])
    Comment.create(comment_params)
    redirect_to song_path(@song.id)
  end

  def destroy
    @song = Song.find(params[:song_id])
    @comment = Comment.find_by(id:params[:id]).destroy
    redirect_to song_path(@song.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, song_id: params[:song_id])
  end


end
