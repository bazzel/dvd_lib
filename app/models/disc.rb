class Disc < ActiveRecord::Base
  acts_as_list
  attr_accessible :number, :position, :recordings_attributes

  validates_presence_of :number
  
  has_many :recordings, :order => "position DESC", :dependent => :nullify
  accepts_nested_attributes_for :recordings, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_one :latest_recording, :class_name => "Recording", :order => "position DESC"
  
  ## Delegates
  delegate :seen?, :to => :latest_recording, :allow_nil => true
  delegate :photo_url, :to => :latest_recording, :allow_nil => true
  # delegate :genres, :to => :latest_recording, :allow_nil => true

  named_scope :for_genre, lambda { |genre_id|
    if genre_id
      {:conditions => { :'genres_recordings.genre_id' => genre_id },
        :joins => "JOIN recordings 
                     ON discs.id = recordings.disc_id 
                   JOIN (SELECT disc_id, 
                                MAX(created_at) AS created_at 
                         FROM   recordings 
                         GROUP  BY disc_id) g 
                     ON recordings.disc_id = g.disc_id 
                        AND recordings.created_at = g.created_at 
                   JOIN genres_recordings 
                     ON genres_recordings.recording_id = recordings.id"  }
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
