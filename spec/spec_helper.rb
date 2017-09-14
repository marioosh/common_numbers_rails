require 'rspec'

require 'active_model'
require 'common_numbers_rails'

I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__), '../config/locales', '*.yml')).to_s]
