require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Disc do
  it {should validate_presence_of(:number)}
end
