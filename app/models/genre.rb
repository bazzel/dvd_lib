class Genre < ActiveRecord::Base
  default_scope :order => 'genres.name'

  attr_accessible :name
  
  validates_presence_of :name
  validates_uniqueness_of :name
  has_and_belongs_to_many :recordings
  
  def to_s
    name
  end
end
