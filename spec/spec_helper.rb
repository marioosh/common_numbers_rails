require 'rspec'

require 'active_model'
require 'common_numbers_rails'

I18n.available_locales = [:pl]
I18n.locale = :pl

I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__), '../config/locales', '*.yml')).to_s]

RSpec.configure do |config|
  config.order     = :random
  config.formatter = :documentation
end
