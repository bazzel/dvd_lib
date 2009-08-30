class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.string :name
      t.integer :position
      t.integer :disc_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :recordings
  end
end
