module MoneyS3
  module Parsers
    class SeznamKmKarta < SeznamType
      include BaseParser

      def km_karta
        array_of_at(KmKarta, ['KmKarta'])
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:km_karta] = km_karta.map(&:to_h_with_attrs) if has? 'KmKarta'

        hash
        super.merge(hash)
      end
    end
  end
end