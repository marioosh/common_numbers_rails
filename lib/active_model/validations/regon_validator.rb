require 'common_numbers'
require 'active_model/validations'

module ActiveModel
  module Validations
    class RegonValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_a_regon, options) unless CommonNumbers::Polish::Regon.new(value).valid?
      end
    end

    module HelperMethods
      def validates_regon_of(*attr_names)
        validates_with RegonValidator, _merge_attributes(attr_names)
      end
    end
  end
end
