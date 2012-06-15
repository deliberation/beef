require 'spec_helper'

describe Argument do
  
  it "has no weight by default" do
    Argument.create.weight.should == 0
  end


end