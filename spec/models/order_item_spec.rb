require 'spec_helper'


describe OrderItem do
  it "should be valid" do
    OrderItem.new.should be_valid
  end
end
