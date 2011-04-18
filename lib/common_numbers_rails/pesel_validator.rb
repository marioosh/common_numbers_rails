require 'common_numbers'
require 'active_model'

class PeselValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    record.errors.add(attribute,  @message) unless CommonNumbers::Polish::Pesel.new(value).valid?
  end

end

module ActiveModel
  
  module Validations

    module HelperMethods

      def validates_pesel_of(*attr_names)
        validates_with PeselValidator, _merge_attributes(attr_names)
      end

    end

  end

end
