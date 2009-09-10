require File.dirname(__FILE__) + '/../spec_helper'

describe WishlistItem do
  it {should validate_presence_of(:name)}
end
