require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Disc do
  it {should validate_presence_of(:number)}
  it {should have_many(:recordings, :order => "position DESC", :dependent => :nullify)}
  it {should have_one(:latest_recording)}
  
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

  describe "delegation" do
  
    it "should delegate seen" do
      disc = Factory.stub(:disc)
      latest = Factory.stub(:recording, :seen => true)
      disc.stub(:latest_recording).and_return(latest)
      disc.seen?.should eql(latest.seen?)
    end
    
  end

end
