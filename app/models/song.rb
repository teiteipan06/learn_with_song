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

end
