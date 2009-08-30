require File.dirname(__FILE__) + '/../spec_helper'

describe Recording do
  it {should validate_presence_of(:name)}
  it {should belong_to(:disc)}
  
end
