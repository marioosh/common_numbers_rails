require 'magick_numbers'
require 'active_model'

class RegonValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "invalid format" unless MagickNumbers::Regon.new(value).valid?
  end

end
