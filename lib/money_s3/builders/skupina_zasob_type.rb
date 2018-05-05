module MoneyS3
  module Builders
    class SkupinaZasobType
      include ParserCore::BaseBuilder

      def builder
        root = Ox::Element.new(name)
        if data.respond_to? :attributes
          data.attributes.each { |k, v| root[k] = v }
        end

        root << build_element('Zkratka', data[:zkratka]) if data.key? :zkratka
        root << build_element('Nazev', data[:nazev]) if data.key? :nazev
        root << build_element('Poznamka', data[:poznamka]) if data.key? :poznamka
        root << build_element('Zkratka0', data[:zkratka0]) if data.key? :zkratka0
        root << build_element('Zkratka1', data[:zkratka1]) if data.key? :zkratka1
        root << build_element('Zkratka2', data[:zkratka2]) if data.key? :zkratka2
        root << build_element('Zkratka3', data[:zkratka3]) if data.key? :zkratka3
        root << build_element('Zkratka4', data[:zkratka4]) if data.key? :zkratka4
        root << build_element('Zkratka5', data[:zkratka5]) if data.key? :zkratka5
        root << build_element('Zkratka6', data[:zkratka6]) if data.key? :zkratka6
        if data.key? :konfigurace
          root << Konfigurace.new('konfigurace', data[:konfigurace]).builder
        end
        if data.key? :definice_ceny
          root << DefiniceCeny.new('definiceCeny', data[:definice_ceny]).builder
        end
        root << build_element('Ceny', data[:ceny]) if data.key? :ceny
        root << build_element('NastSklad', data[:nast_sklad]) if data.key? :nast_sklad
        root << build_element('CisSkupVPL', data[:cis_skup_vpl]) if data.key? :cis_skup_vpl
        root << build_element('IN_CisOdde', data[:in_cis_odde]) if data.key? :in_cis_odde
        if data.key? :uc_pohyb_m
          root << UctyPohybuType.new('UcPohybM', data[:uc_pohyb_m]).builder
        end
        if data.key? :uc_pohyb_z
          root << UctyPohybuType.new('UcPohybZ', data[:uc_pohyb_z]).builder
        end
        if data.key? :uc_pohyb_v
          root << UctyPohybuType.new('UcPohybV', data[:uc_pohyb_v]).builder
        end
        root << build_element('UcVyrobkVV', data[:uc_vyrobk_vv]) if data.key? :uc_vyrobk_vv
        root << build_element('ProdejkVz', data[:prodejk_vz]) if data.key? :prodejk_vz
        root << build_element('VDodLstVz', data[:v_dod_lst_vz]) if data.key? :v_dod_lst_vz
        root << build_element('PDodLstVz', data[:p_dod_lst_vz]) if data.key? :p_dod_lst_vz

        root
      end
    end
  end
end