# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "common_numbers_rails/version"

Gem::Specification.new do |s|
  s.name        = "common_numbers_rails"
  s.version     = CommonNumbersRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Nosinski"]
  s.email       = ["marioosh@5dots.pl"]
  s.homepage    = "https://github.com/marioosh/common_numbers_rails"
  s.summary     = %q{Rails 3 validators for common numbers like PESEL, NIP, REGON}
  s.description = %q{Rails 3 validators for common numbers like PESEL, NIP, REGON}

  s.add_dependency('common_numbers', '>=0.1.5')
  s.add_dependency('activemodel','>= 3.0.0')

  s.rubyforge_project = "common_numbers_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
