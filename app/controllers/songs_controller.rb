class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @songs = Song.order("created_at DESC")
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @song.comments.includes(:user)
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  def search
    @songs = Song.search(params[:keyword])
  end

  private
  def song_params
    params.require(:song).permit(:title, :video, :singer, :category, :lyrics_origin, :lyrics_japanese).merge(user_id: current_user.id)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
