class CreateDiscs < ActiveRecord::Migration
  def self.up
    create_table :discs do |t|
      t.string :number
      t.integer :position
      t.timestamps
    end
  end
  
  def self.down
    drop_table :discs
  end
end
