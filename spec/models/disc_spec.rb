require File.dirname(__FILE__) + '/../spec_helper'

describe Disc do
  it "should be valid" do
    Disc.new.should be_valid
  end
end
