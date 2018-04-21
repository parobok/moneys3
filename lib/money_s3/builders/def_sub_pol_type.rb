module MoneyS3
  module Builders
    class DefSubPolType
      include BaseBuilder

      def builder
        root = Ox::Element.new(name)
        if data.respond_to? :attributes
          data.attributes.each { |k, v| root[k] = v }
        end

        root << build_element('MJNaSadu', data[:mj_na_sadu]) if data.key? :mj_na_sadu
        if data.key? :polozka
          root << PolSklDoklType.new('Polozka', data[:polozka]).builder
        end

        root
      end
    end
  end
end