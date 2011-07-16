class CreateInstagrams < ActiveRecord::Migration
  def self.up
    create_table :instagrams do |t|
      t.string :gram_id
      t.string :text
      t.string :link
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :instagrams
  end
end
