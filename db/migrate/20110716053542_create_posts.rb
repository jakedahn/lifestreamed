class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string  :post_type
      t.integer :foursquare_id
      t.integer :twitter_id
      t.integer :lastfm_id
      t.integer :posterous_id
      t.integer :github_id
      t.integer :instagram_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
