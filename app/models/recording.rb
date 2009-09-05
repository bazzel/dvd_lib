class Recording < ActiveRecord::Base
  belongs_to :disc
  acts_as_list :scope => :disc
  attr_accessible :name, :position, :disc_id, :seen
  
  validates_presence_of :name

  named_scope :seen, :conditions => {:seen => true}
end
