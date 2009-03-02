require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Dummy namespace" do
  it 'should exit' do
    ::Object.const_defined?('Dummy').should be_true
  end

  it 'should be a module' do
    Dummy.class.should == Module
  end
end

describe "Dummy::Content namespace" do
  it "should exist" do
    Dummy.const_defined?('Content').should be_true
  end
  
  it 'should be a class' do
    Dummy::Content.class.should == Class
  end
end 

describe "Dummy::Content" do
  it "should produce random words within a default range of 25-255" do
    100.times do
      words = Dummy::Content.words
      words.length.should >= 25
      words.length.should <= 255
    end
  end

  describe 'words' do 
    it "should produce random words within minimum defined range" do
      100.times do
        words = Dummy::Content.words(200)
        words.length.should >= 200
        words.length.should <= 255
      end
    end

    it "should produce random words within maximum defined range" do
      100.times do
        words = Dummy::Content.words(25, 200)
        words.length.should >= 25
        words.length.should <= 255
      end
    end

    it "should tolerate a narrow range" do
      100.times do
        words = Dummy::Content.words(25, 26)
        words.length.should_not < 25
        words.length.should_not > 26
      end
    end

    it "should tolerate a small max" do
      100.times do
        words = Dummy::Content.words(1, 2)
        words.length.should_not < 1
        words.length.should_not > 2
      end
    end

    it "should be able to specfiy an exact length" do
      100.times do
        words = Dummy::Content.words(26, 26)
        words.length.should == 26
      end
    end

    it "words should not allow min to be greater than max" do
        p = Proc.new {
          words = Dummy::Content.words(27, 26)
        }
        p.call.should raise_error
    end

    it "should tolerate a random length close to the max allowed length" do
      100.times do
        #Dummy::Content.stub!(:get_random_length).and_return(200)
        words = Dummy::Content.words(26, 202)
        words.length.should >= 26
        words.length.should <= 202
      end
    end
  end

  describe 'string' do
    it "should produce a string of exact length" do
      10.times do |l|
        length = l 
        words = Dummy::Content.string(length) 
        words.length.should == length
      end
      10.times do |l|
        length = l * 10 
        words = Dummy::Content.string(length) 
        words.length.should == length
      end
    end
  end

  describe 'text' do
    it "should return variable text" do
      100.times do 
        text = Dummy::Content.text()
        text.length.should > 2048
        text.length.should < 4096
      end
    end
  end

  describe 'date' do
    it "should return a random date" do
      100.times do
        begin_year = 1988
        end_year = 2004
        begin_epoch = Time.local(begin_year).to_i
        end_epoch   = Time.local(end_year).to_i - 1
        date = Dummy::Content.date(begin_year, end_year)
        date.class.should == Time
        date.to_i.should >= begin_epoch
        date.to_i.should <= end_epoch
      end
    end

    it "should have default values" do
      100.times do
        begin_epoch = 0
        end_epoch  = Time.local(Time.now.strftime("%Y").to_i + 1).to_i - 1
        date = Dummy::Content.date()
        date.class.should == Time
        date.to_i.should >= begin_epoch
        date.to_i.should <= end_epoch
      end

    end
  end





  
end
