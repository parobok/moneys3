module MoneyS3
  module Builders
    class Valuty2
      include BaseBuilder

      def builder
        root = Ox::Element.new(name)
        if data.respond_to? :attributes
          data.attributes.each { |k, v| root[k] = v }
        end

        if data.key? :mena
          root << MenaType.new('Mena', data[:mena]).builder
        end
        if data.key? :souhrn_dph
          root << SouhrnDPHType.new('SouhrnDPH', data[:souhrn_dph]).builder
        end
        root << build_element('Celkem', data[:celkem]) if data.key? :celkem

        root
      end
    end
  end
end