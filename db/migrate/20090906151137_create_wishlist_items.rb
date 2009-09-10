class CreateWishlistItems < ActiveRecord::Migration
  def self.up
    create_table :wishlist_items do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :wishlist_items
  end
end
