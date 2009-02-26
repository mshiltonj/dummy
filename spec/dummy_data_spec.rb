require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Dummy namespace" do
  it 'should exit' do
    ::Object.const_defined?('Dummy').should be_true
  end

  it 'should be a module' do
    Dummy.class.should == Module
  end
end

describe "Dummy::Data namespace" do
  it "should exist" do
    Dummy.const_defined?('Data').should be_true
  end
  
  it 'should be a class' do
    Dummy::Data.class.should == Class
  end
end 
