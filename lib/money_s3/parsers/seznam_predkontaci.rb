require 'money_s3/parsers/base_parser'
require 'money_s3/parsers/predkontace'

module MoneyS3
  module Parsers
    class SeznamPredkontaci
      include BaseParser

      def predkontace
        array_of_at(Predkontace, ['Predkontace'])
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:predkontace] = predkontace.map(&:to_h_with_attrs) if has? 'Predkontace'

        hash
      end
    end
  end
end