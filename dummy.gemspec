# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dummy}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Hilton"]
  s.date = %q{2009-03-01}
  s.description = %q{Generating dummy data, perhaps for integration or performance testing}
  s.email = %q{mshiltonj@gmail.com}
  s.files = ["dummy.gemspec", "coverage", "tasks", "spec_report", "dummy-0.0.0.gem", "spec", "MIT-LICENCE", "README", "lib", "Rakefile", "VERSION.yml", "lib/dummy.rb", "lib/dummy", "lib/dummy/content.rb", "lib/dummy/user.rb", "tasks/jeweler.rake", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mshiltonj/dummy}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Generating dummy data, perhaps for integration or performance testing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
