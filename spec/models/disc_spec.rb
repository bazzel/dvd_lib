require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Disc do
  it {should validate_presence_of(:number)}
  it {should have_many(:recordings, :order => "position DESC", :dependent => :nullify)}
  
  describe "title" do
    it "should return '(Empty)' if recordings collection is empty" do
      disc = Factory.stub(:disc)
      disc.stub(:recordings).and_return([])
      
      disc.title.should eql('(Empty)')
    end
    
    it "should return title of latest recording" do
      disc = Factory.stub(:disc)
      recordings = [Factory.stub(:recording, :name => 'foo'), 
                    Factory.stub(:recording, :name => 'bar')]
      disc.stub(:recordings).and_return(recordings)
      
      disc.title.should eql('foo')
    end
  end
  
end
