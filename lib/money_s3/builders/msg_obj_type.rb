module MoneyS3
  module Builders
    class MsgObjType < MessageType
      include BaseBuilder

      def builder
        root = Ox::Element.new(name)
        if data.respond_to? :attributes
          data.attributes.each { |k, v| root[k] = v }
        end

        super.nodes.each do |n|
          root << n
        end

        if data.key? :dod_odb
          root << MsgFirmaType.new('DodOdb', data[:dod_odb]).builder
        end
        if data.key? :konec_prij
          root << MsgFirmaType.new('KonecPrij', data[:konec_prij]).builder
        end
        if data.key? :polozka
          data[:polozka].each { |i| root << MsgPolozType.new('Polozka', i).builder }
        end
        if data.key? :data
          root << ObjednavkaType.new('Data', data[:data]).builder
        end

        root
      end
    end
  end
end