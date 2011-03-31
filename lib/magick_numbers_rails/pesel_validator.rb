require 'magick_numbers'
require 'active_model'

class PeselValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "invalid format" unless MagickNumbers::Pesel.new(value).valid?
  end

end
