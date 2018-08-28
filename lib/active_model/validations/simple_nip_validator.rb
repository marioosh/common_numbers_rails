require 'common_numbers'
require 'active_model/validations'

module ActiveModel
  module Validations
    class SimpleNipValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_a_nip, options) unless CommonNumbers::Polish::SimpleNip.new(value).valid?
      end
    end

    module HelperMethods
      def validates_nip_of(*attr_names)
        validates_with NipValidator, _merge_attributes(attr_names)
      end
    end
  end
end
