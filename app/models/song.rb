class Song < ApplicationRecord
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  with_options presence: true do
    validates :video
    validates :title
    validates :singer
    validates :category
    validates :lyrics_origin
    validates :lyrics_japanese
  end

  def self.search(search)
    if search != ""
      Song.where('title LIKE(?)', "%#{search}%")
      Song.where('singer LIKE(?)', "%#{search}%")
      Song.where('category LIKE(?)', "%#{search}%")
    else
      Song.all
    end
  end

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

end
