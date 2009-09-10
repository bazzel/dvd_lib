class Recording < ActiveRecord::Base
  default_scope :order => 'recordings.name'
  
  belongs_to :disc
  has_and_belongs_to_many :genres

  acts_as_list :scope => :disc
  # attr_accessible :name, :position, :disc_id, :seen, :photo
  
  validates_presence_of :name

  named_scope :seen, :conditions => {:seen => true}
  
  has_attached_file :photo, :styles => { :small => "64X64>" },
                            :default_url => "/images/default_:style_photo.gif",
                            :url => Rails.env == 'development' ? ':rails_root/tmp/:attachment/:id/:style/:filename' : '/system/:attachment/:id/:style/:filename'
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
    
end
