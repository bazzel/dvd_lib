class AddAttachmentsPhotoToRecording < ActiveRecord::Migration
  def self.up
    add_column :recordings, :photo_file_name, :string
    add_column :recordings, :photo_content_type, :string
    add_column :recordings, :photo_file_size, :integer
    add_column :recordings, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :recordings, :photo_file_name
    remove_column :recordings, :photo_content_type
    remove_column :recordings, :photo_file_size
    remove_column :recordings, :photo_updated_at
  end
end
