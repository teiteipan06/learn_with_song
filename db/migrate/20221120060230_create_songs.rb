class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string  :title,                 null: false
      t.string  :video,                 null: false
      t.string  :singer,                null: false
      t.string  :category,              null: false
      t.text    :lyrics_origin,         null: false
      t.text    :lyrics_japanese,       null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
