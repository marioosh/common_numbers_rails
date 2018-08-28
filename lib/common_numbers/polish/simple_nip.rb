module CommonNumbers
  module Polish
    class SimpleNip < CommonNumbers::Base

      def initialize(num)
        @magick_number = num.to_s
        @mask = [ 6, 5, 7, 2, 3, 4, 5, 6, 7 ]
        @modulo = 11
        @regexp = /^[0-9]{1,45}$/

      end

      def validate_length
        @magick_number.size == 10
      end

      def validate_sum_control
        mod = checksum % modulo
        mod === magick_array.shift
      end
    end
  end
end
