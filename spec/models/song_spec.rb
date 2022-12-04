require 'rails_helper'

RSpec.describe Song, type: :model do
  before do
    @song = FactoryBot.build(:song)
  end

  describe '曲を投稿できるとき' do
    context '曲を投稿できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@song).to be_valid
      end
    end

    context '曲を投稿できないとき' do
      it 'titleが空では登録できないこと' do
        @song.title = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Title can't be blank")
      end
      it 'videoが空では登録できないこと' do
        @song.video = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Video can't be blank")
      end
      it 'singerが空では登録できないこと' do
        @song.singer = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Singer can't be blank")
      end
      it 'categoryが空では登録できないこと' do
        @song.category = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Category can't be blank")
      end
      it 'lyrics_originが空では登録できないこと' do
        @song.lyrics_origin = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Lyrics origin can't be blank")
      end
      it 'lyrics_japaneseが空では登録できないこと' do
        @song.lyrics_japanese = ''
        @song.valid?
        expect(@song.errors.full_messages).to include("Lyrics japanese can't be blank")
      end
      it'userが紐付いていなければ出品できない' do
        @song.user = nil
        @song.valid?
        expect(@song.errors.full_messages).to include('User must exist')
      end
    end
  end
end
