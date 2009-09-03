class Disc < ActiveRecord::Base
  acts_as_list
  attr_accessible :number, :position, :recordings_attributes

  validates_presence_of :number
  
  has_many :recordings, :order => "position DESC", :dependent => :nullify
  accepts_nested_attributes_for :recordings, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_one :latest_recording, :class_name => "Recording", :order => "position DESC"
  
  ## Delegates
  delegate :seen?, :to => :latest_recording, :allow_nil => true

  def title
    if recordings.empty?
      '(Empty)'
    else
      recordings.first.name
    end
  end
  
end
