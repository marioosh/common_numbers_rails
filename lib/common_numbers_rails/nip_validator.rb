require 'common_numbers'
require 'active_model'

class NipValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "invalid format" unless CommonNumbers::Polish::Nip.new(value).valid?
  end

end
