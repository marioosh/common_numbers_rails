# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "magick_numbers_rails/version"

Gem::Specification.new do |s|
  s.name        = "magick_numbers_rails"
  s.version     = MagickNumbersRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Nosinski"]
  s.email       = ["marioosh@5dots.pl"]
  s.homepage    = "https://github.com/marioosh/magick_numbers_rails"
  s.summary     = %q{Rails 3 validators for magick numbers like PESEL, NIP, REGON}
  s.description = %q{Rails 3 validators for magick numbers like PESEL, NIP, REGON}

  s.add_dependency('magick_numbers', '>=0.1.3')
  s.add_dependency('activemodel','>= 3.0.0')

  s.rubyforge_project = "magick_numbers_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
