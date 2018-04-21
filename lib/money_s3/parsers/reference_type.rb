module MoneyS3
  module Parsers
    class ReferenceType
      include BaseParser

      def id
        array_of_at(String, ['ID'])
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:id] = id if has? 'ID'

        hash
      end
    end
  end
end