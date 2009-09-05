require File.dirname(__FILE__) + '/../spec_helper'

describe Recording do
  it {should validate_presence_of(:name)}
  it {should belong_to(:disc)}

  it "should only return Recordings marked as seen" do
    foo = Factory(:recording, :seen => true)
    bar = Factory(:recording, :seen => false)
    
    Recording.seen.should include(foo)
    Recording.seen.should_not include(bar)
  end
end
