require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Dummy namespace" do
  it 'should exit' do
    ::Object.const_defined?('Dummy').should be_true
  end

  it 'should be a module' do
    Dummy.class.should == Module
  end
end

describe "Dummy::User namespace" do
  it "should exist" do
    Dummy.const_defined?('User').should be_true
  end
  
  it 'should be a class' do
    Dummy::User.class.should == Class
  end
end 

describe "Dummy::User" do
  before(:all) do
    @user = Dummy::User.new
  end

  it "should be instantiatable" do
    @user.should_not be_nil 
  end

  it "should have a login" do 
    @user.login.should_not be_nil
  end

  it "should have an email" do
    @user.email_address.should_not be_nil
  end

  it "should have a first_name" do
    @user.first_name.should_not be_nil
  end

  it "should have a last_name" do
    @user.last_name.should_not be_nil
  end

  it "should have a full_name that matches first_name last_name" do
    @user.full_name.should_not be_nil
    @user.full_name.should == "#{@user.first_name} #{@user.last_name}"
  end

  it "should have an email pointing to @example.com" do
    @user.email_address.should match(/@example.com$/)
  end

  it "should have a login that matches the email user name" do
    @user.email_address.should match(/^#{@user.login}@/)
  end

end


