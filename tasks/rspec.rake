require 'spec/rake/spectask'

task :default => :spec

desc 'spec'
task :spec => 'spec:default'

namespace :spec do
  task :default => 'spec:spec'

  Spec::Rake::SpecTask.new('spec:spec') do |t| 
    t.spec_opts = ['--options', "\"spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*_spec.rb']
  end 

  desc 'run spec tests with rcov' 
  Spec::Rake::SpecTask.new(:rcov) do |t| 
    t.spec_opts = ['--options', "\"spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines(File.join(File.dirname(__FILE__), '..', 'spec', 'rcov.opts')).map {|l| l.chomp.split " "}.flatten
    end
  end 

end


