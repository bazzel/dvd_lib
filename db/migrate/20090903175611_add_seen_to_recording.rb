class AddSeenToRecording < ActiveRecord::Migration
  def self.up
    add_column :recordings, :seen, :boolean, :default => false
  end

  def self.down
    remove_column :recordings, :seen
  end
end
