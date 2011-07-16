class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string  :post_type
      t.integer :foursquare_id
      t.integer :twitter_id
      t.integer :lastfm
      t.integer :posterous
      t.integer :github
      t.integer :instagram

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
