module MoneyS3
  module Parsers
    class SeznamZasoba < SeznamType
      include ParserCore::BaseParser

      def zasoba
        array_of_at(Zasoba, ['Zasoba'])
      end

      def to_h_with_attrs
        hash = ParserCore::HashWithAttributes.new({}, attributes)

        hash[:zasoba] = zasoba.map(&:to_h_with_attrs) if has? 'Zasoba'

        hash
        super.merge(hash)
      end
    end
  end
end