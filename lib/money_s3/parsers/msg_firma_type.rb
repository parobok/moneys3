require 'money_s3/parsers/base_parser'
require 'money_s3/parsers/firma_type'
require 'money_s3/parsers/message_type'

module MoneyS3
  module Parsers
    class MsgFirmaType
      include BaseParser

      def data
        submodel_at(FirmaType, 'Data')
      end

      def osoba
        array_of_at(MessageType, ['Osoba'])
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:data] = data.to_h_with_attrs if has? 'Data'
        hash[:osoba] = osoba.map(&:to_h_with_attrs) if has? 'Osoba'

        hash
      end
    end
  end
end