class Disc < ActiveRecord::Base
  acts_as_list
  attr_accessible :number, :position, :recordings_attributes

  validates_presence_of :number
  
  has_many :recordings, :order => "position DESC", :dependent => :nullify
  accepts_nested_attributes_for :recordings, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_one :latest_recording, :class_name => "Recording", :order => "position DESC"
  
  ## Delegates
  delegate :seen?, :to => :latest_recording, :allow_nil => true
  delegate :photo, :to => :latest_recording, :allow_nil => true
  # delegate :genres, :to => :latest_recording, :allow_nil => true

  # We need Rails 2.3.2 for this (both 2.3.3 and 2.3.4 ignore :include option, 
  # see https://rails.lighthouseapp.com/projects/8994/tickets/2998-named_scope-ignores-include-option)
  named_scope :for_genre, lambda { |genre_id|
    if genre_id
      { :select => 'discs.*',
        :conditions => { :'genres.id' => genre_id },
        :include => {:latest_recording => [:genres]}  }
    end
  }
  
  def title
    if recordings.empty?
      '(Empty)'
    else
      recordings.first.name
    end
  end
  
end
