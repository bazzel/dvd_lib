class Disc < ActiveRecord::Base
  acts_as_list :scope
  attr_accessible :number, :position

  validates_presence_of :number
  
  def title
    'Ipsum Lorum'
  end
  
end
