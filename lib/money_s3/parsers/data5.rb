module MoneyS3
  module Parsers
    class Data5
      include ParserCore::BaseParser

      def zauctovani_dph
        submodel_at(ZauctovaniDPHType, 'ZauctovaniDPH')
      end

      def to_h_with_attrs
        hash = ParserCore::HashWithAttributes.new({}, attributes)

        hash[:zauctovani_dph] = zauctovani_dph.to_h_with_attrs if has? 'ZauctovaniDPH'

        hash
      end
    end
  end
end