module MoneyS3
  module Parsers
    class MsgPrevodkaType < MessageType
      include ParserCore::BaseParser

      def sklad_pro_pr
        submodel_at(MessageType, 'SkladProPr')
      end

      def dod_odb
        submodel_at(MsgFirmaType, 'DodOdb')
      end

      def konec_prij
        submodel_at(MsgFirmaType, 'KonecPrij')
      end

      def polozka
        array_of_at(MsgPolozType, ['Polozka'])
      end

      def to_h
        hash = {}
        hash[:attributes] = attributes

        hash[:sklad_pro_pr] = sklad_pro_pr.to_h if has? 'SkladProPr'
        hash[:dod_odb] = dod_odb.to_h if has? 'DodOdb'
        hash[:konec_prij] = konec_prij.to_h if has? 'KonecPrij'
        hash[:polozka] = polozka.map(&:to_h) if has? 'Polozka'

        hash
        super.merge(hash)
      end
    end
  end
end