class Recording < ActiveRecord::Base
  belongs_to :disc
  acts_as_list :scope => :disc
  attr_accessible :name, :position, :disc_id
  
  validates_presence_of :name
  
end
