module MoneyS3
  module Parsers
    class MsgZakazkaType < MessageType
      include BaseParser

      def data
        submodel_at(ZakazkaType, 'Data')
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:data] = data.to_h_with_attrs if has? 'Data'

        hash
        super.merge(hash)
      end
    end
  end
end