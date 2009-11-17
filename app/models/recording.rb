class Recording < ActiveRecord::Base
  default_scope :order => 'recordings.name'
  
  belongs_to :disc
  has_and_belongs_to_many :genres

  acts_as_list :scope => :disc
  
  validates_presence_of :name

  named_scope :seen, :conditions => {:seen => true}
  
  validates_url_format_of :photo_url,
                          :allow_nil => true,
                          :allow_blank => true

  # has_attached_file :photo, :styles => { :small => "64X64>", :iphone => '148x148>' },
  #                           :default_url => "/images/default_:style_photo.png",
  #                           :url => Rails.env == 'development' ? ':rails_root/tmp/:attachment/:id/:style/:filename' : '/system/:attachment/:id/:style/:filename'
  # validates_attachment_size :photo, :less_than => 5.megabytes
  # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
    
end