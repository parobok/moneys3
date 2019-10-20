module MoneyS3
  module Builders
    class SeznamDLPrij
      include ParserCore::BaseBuilder

      def builder
        root = Ox::Element.new(name)
        root = add_attributes_and_namespaces(root)

        if data.key? :dl_prij
          data[:dl_prij].each { |i| root << DLPrij.new('DLPrij', i).builder }
        end

        root
      end
    end
  end
end