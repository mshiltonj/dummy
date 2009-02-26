require 'spec/rake/spectask'

desc 'run spec tests'
Spec::Rake::SpecTask.new(:spec) do |t| 
  t.spec_opts = ['--options', "\"spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end 

