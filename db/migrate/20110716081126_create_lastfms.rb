class CreateLastfms < ActiveRecord::Migration
  def self.up
    create_table :lastfms do |t|
      t.integer :time_id
      t.string :artist
      t.string :album
      t.string :track
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :lastfms
  end
end
