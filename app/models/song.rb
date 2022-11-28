class Song < ApplicationRecord
  
  belongs_to :user
  has_many :comments


  with_options presence: true do
    validates :video
    validates :title
    validates :singer
    validates :category
    validates :lyrics_origin
    validates :lyrics_japanese
  end

end
