require 'money_s3/parsers/base_parser'
require 'money_s3/parsers/eet_type'

module MoneyS3
  module Parsers
    class DoklRefType
      include BaseParser

      def id_dokladu
        at 'IDDokladu'
      end

      def cislo_dokladu
        at 'CisloDokladu'
      end

      def druh_dokladu
        at 'DruhDokladu'
      end

      def rok
        at 'Rok'
      end

      def eet
        submodel_at(EETType, 'EET')
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:id_dokladu] = id_dokladu if has? 'IDDokladu'
        hash[:cislo_dokladu] = cislo_dokladu if has? 'CisloDokladu'
        hash[:druh_dokladu] = druh_dokladu if has? 'DruhDokladu'
        hash[:rok] = rok if has? 'Rok'
        hash[:eet] = eet.to_h_with_attrs if has? 'EET'

        hash
      end
    end
  end
end