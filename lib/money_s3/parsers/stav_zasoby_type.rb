require 'money_s3/parsers/base_parser'

module MoneyS3
  module Parsers
    class StavZasobyType
      include BaseParser

      def zasoba
        at 'Zasoba'
      end

      def rezervace
        at 'Rezervace'
      end

      def objednano
        at 'Objednano'
      end

      def to_h
        hash = WithAttributes.new({})
        hash.attributes = attributes

        hash[:zasoba] = zasoba if has? 'Zasoba'
        hash[:rezervace] = rezervace if has? 'Rezervace'
        hash[:objednano] = objednano if has? 'Objednano'

        hash
      end
    end
  end
end