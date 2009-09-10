class CreateGenresRecordingsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :genres_recordings, :id => false do |t|
      t.references :genre
      t.references :recording
    end
  end

  def self.down
    drop_table :genres_recordings
  end
end
