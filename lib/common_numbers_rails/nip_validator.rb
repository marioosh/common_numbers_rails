require 'common_numbers'
require 'active_model'

class NipValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    record.errors[attribute] << @message unless CommonNumbers::Polish::Nip.new(value).valid?
  end

end

module ActiveModel

  module Validations

    module HelperMethods

      def validates_nip_of(*attr_names)
        validates_with NipValidator, _merge_attributes(attr_names)
      end

    end

  end

end
