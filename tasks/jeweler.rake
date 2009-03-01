#begin
  require 'rubygems'
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "dummy"
    s.summary = "Generating dummy data, perhaps for integration or performance testing"
    s.email = "mshiltonj@gmail.com"
    s.homepage = "http://github.com/mshiltonj/dummy"
    s.description = "Generating dummy data, perhaps for integration or performance testing"
    s.authors = ["Steven Hilton"]
    s.files =  FileList["[A-z]*", "{bin,generators,lib,test,tasks}/**/*"]
  end
#rescue LoadError
#  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
#end


