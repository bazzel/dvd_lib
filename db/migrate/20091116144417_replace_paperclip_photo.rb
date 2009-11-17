class ReplacePaperclipPhoto < ActiveRecord::Migration
  def self.up
    remove_column :recordings, :photo_file_name
    remove_column :recordings, :photo_content_type
    remove_column :recordings, :photo_file_size
    remove_column :recordings, :photo_updated_at

    add_column :recordings, :photo_url, :string
  end

  def self.down
    add_column :recordings, :photo_file_name, :string
    add_column :recordings, :photo_content_type, :string
    add_column :recordings, :photo_file_size, :integer
    add_column :recordings, :photo_updated_at, :datetime

    remove_column :recordings, :photo_url
  end
end
