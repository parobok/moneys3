require 'money_s3/parsers/base_parser'
require 'money_s3/parsers/predkontace_de_type'

module MoneyS3
  module Parsers
    class SeznamPredkontaciDE
      include BaseParser

      def predkontace_de
        array_of_at(PredkontaceDEType, ['PredkontaceDE'])
      end

      def to_h
        hash = WithAttributes.new({})
        hash.attributes = attributes

        hash[:predkontace_de] = predkontace_de.map(&:to_h) if has? 'PredkontaceDE'

        hash
      end
    end
  end
end