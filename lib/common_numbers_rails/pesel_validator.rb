require 'common_numbers'
require 'active_model'

class PeselValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "invalid format" unless CommonNumbers::Polish::Pesel.new(value).valid?
  end

end
