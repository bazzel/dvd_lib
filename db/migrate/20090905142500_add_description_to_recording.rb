class AddDescriptionToRecording < ActiveRecord::Migration
  def self.up
    add_column :recordings, :description, :text
  end

  def self.down
    remove_column :recordings, :description
  end
end
