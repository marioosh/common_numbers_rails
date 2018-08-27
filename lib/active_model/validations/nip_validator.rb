require 'common_numbers'
require 'active_model/validations'

module ActiveModel
  module Validations
    class NipValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_a_nip, options) unless validator.new(value).valid?
      end

      private

      def validator
        "CommonNumbers::Polish::#{options[:type].to_s.camelize}".constantize
      end
    end

    module HelperMethods
      def validates_nip_of(*attr_names)
        validates_with NipValidator, _merge_attributes(attr_names)
      end
    end
  end
end
