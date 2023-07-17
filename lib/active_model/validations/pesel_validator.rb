require 'common_numbers'
require 'active_model/validations'

module ActiveModel
  module Validations
    class PeselValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.0.0')
          record.errors.add(attribute, :not_a_pesel, options) unless CommonNumbers::Polish::Pesel.new(value).valid?
        else
          record.errors.add(attribute, :not_a_pesel, **options) unless CommonNumbers::Polish::Pesel.new(value).valid?
        end
      end
    end

    module HelperMethods
      def validates_pesel_of(*attr_names)
        validates_with PeselValidator, _merge_attributes(attr_names)
      end
    end
  end
end
