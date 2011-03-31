require 'magick_numbers'
require 'active_model'

class NipValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "invalid format" unless MagickNumbers::Nip.new(value).valid?
  end

end
