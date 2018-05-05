module MoneyS3
  module Parsers
    class NesklPolozka
      include ParserCore::BaseParser

      def zkrat
        at 'Zkrat'
      end

      def mj
        at 'MJ'
      end

      def uziv_code
        at 'UzivCode'
      end

      def katalog
        at 'Katalog'
      end

      def bar_code
        at 'BarCode'
      end

      def zaloha
        at 'Zaloha'
      end

      def zdan_zaloha
        at 'ZdanZaloha'
      end

      def konec_odpocet
        at 'KonecOdpocet'
      end

      def typ_zar_doby
        at 'TypZarDoby'
      end

      def zar_doba
        at 'ZarDoba'
      end

      def protizapis
        at 'Protizapis'
      end

      def plneno_dph
        at 'PlnenoDPH'
      end

      def hmotnost
        at 'Hmotnost'
      end

      def vyrobni_cis
        at 'VyrobniCis'
      end

      def dat_exp
        at 'DatExp'
      end

      def dat_nakupu
        at 'DatNakupu'
      end

      def dodavatel
        submodel_at(FirmaType, 'Dodavatel')
      end

      def predm_pln
        at 'PredmPln'
      end

      def to_h_with_attrs
        hash = ParserCore::HashWithAttributes.new({}, attributes)

        hash[:zkrat] = zkrat if has? 'Zkrat'
        hash[:mj] = mj if has? 'MJ'
        hash[:uziv_code] = uziv_code if has? 'UzivCode'
        hash[:katalog] = katalog if has? 'Katalog'
        hash[:bar_code] = bar_code if has? 'BarCode'
        hash[:zaloha] = zaloha if has? 'Zaloha'
        hash[:zdan_zaloha] = zdan_zaloha if has? 'ZdanZaloha'
        hash[:konec_odpocet] = konec_odpocet if has? 'KonecOdpocet'
        hash[:typ_zar_doby] = typ_zar_doby if has? 'TypZarDoby'
        hash[:zar_doba] = zar_doba if has? 'ZarDoba'
        hash[:protizapis] = protizapis if has? 'Protizapis'
        hash[:plneno_dph] = plneno_dph if has? 'PlnenoDPH'
        hash[:hmotnost] = hmotnost if has? 'Hmotnost'
        hash[:vyrobni_cis] = vyrobni_cis if has? 'VyrobniCis'
        hash[:dat_exp] = dat_exp if has? 'DatExp'
        hash[:dat_nakupu] = dat_nakupu if has? 'DatNakupu'
        hash[:dodavatel] = dodavatel.to_h_with_attrs if has? 'Dodavatel'
        hash[:predm_pln] = predm_pln if has? 'PredmPln'

        hash
      end
    end
  end
end