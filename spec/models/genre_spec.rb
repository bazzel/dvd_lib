require File.dirname(__FILE__) + '/../spec_helper'

describe Genre do
  it {should validate_presence_of(:name)}
  it {should have_and_belong_to_many(:recordings)}
  
  it do
    Factory(:genre)
    should validate_uniqueness_of(:name)
  end
end
