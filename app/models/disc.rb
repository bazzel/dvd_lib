class Disc < ActiveRecord::Base
  acts_as_list :scope
  attr_accessible :number, :position
  
end
