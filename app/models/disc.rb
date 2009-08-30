class Disc < ActiveRecord::Base
  acts_as_list
  attr_accessible :number, :position

  validates_presence_of :number
  
  has_many :recordings, :order => "position DESC", :dependent => :nullify
  
  def title
    if recordings.empty?
      '(Empty)'
    else
      recordings.first.name
    end
  end
  
end
