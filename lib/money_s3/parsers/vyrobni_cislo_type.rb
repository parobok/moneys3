module MoneyS3
  module Parsers
    class VyrobniCisloType
      include ParserCore::BaseParser

      def vyrobni_cis
        at 'VyrobniCis'
      end

      def datum_vyrob
        at 'DatumVyrob'
      end

      def carovy_kod
        at 'CarovyKod'
      end

      def to_h_with_attrs
        hash = ParserCore::HashWithAttributes.new({}, attributes)

        hash[:vyrobni_cis] = vyrobni_cis if has? 'VyrobniCis'
        hash[:datum_vyrob] = datum_vyrob if has? 'DatumVyrob'
        hash[:carovy_kod] = carovy_kod if has? 'CarovyKod'

        hash
      end
    end
  end
end