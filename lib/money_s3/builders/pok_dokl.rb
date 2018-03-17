require 'money_s3/builders/base_builder'
require 'money_s3/builders/eet_type'
require 'money_s3/builders/doklad_firma_type'
require 'money_s3/builders/valuty'
require 'money_s3/builders/moje_firma_type'
require 'money_s3/builders/vlajky'
require 'money_s3/builders/souhrn_dph_type'
require 'money_s3/builders/norm_poloz_ud_type'
require 'money_s3/builders/rozuct_poloz_ud_type'

module MoneyS3
  module Builders
    class PokDokl
      include BaseBuilder

      attr_accessor :vydej, :doklad, :ev_cis_dokl, :zpusob_uctovani, :popis, :dat_uc_pr, :dat_vyst, :dat_plat, :dat_pln, :dat_upl_dph, :prijat_dokl, :var_sym, :par_sym, :pokl, :pr_kont, :cleneni, :stred, :zakazka, :cinnost, :s_sazba, :z_sazba, :stat_moss, :pozn, :d_rada, :d_cislo, :vyst, :typ_dokl, :zjedn_d, :celkem, :eet, :adresa, :valuty, :moje_firma, :vlajky, :souhrn_dph, :dokumenty, :seznam_norm_polozek, :seznam_rozuct_polozek

      def builder
        root = Ox::Element.new(element_name)

        root << (Ox::Element.new('Vydej') << vydej) if vydej
        root << (Ox::Element.new('Doklad') << doklad) if doklad
        root << (Ox::Element.new('EvCisDokl') << ev_cis_dokl) if ev_cis_dokl
        root << (Ox::Element.new('ZpusobUctovani') << zpusob_uctovani) if zpusob_uctovani
        root << (Ox::Element.new('Popis') << popis) if popis
        root << (Ox::Element.new('DatUcPr') << dat_uc_pr) if dat_uc_pr
        root << (Ox::Element.new('DatVyst') << dat_vyst) if dat_vyst
        root << (Ox::Element.new('DatPlat') << dat_plat) if dat_plat
        root << (Ox::Element.new('DatPln') << dat_pln) if dat_pln
        root << (Ox::Element.new('DatUplDPH') << dat_upl_dph) if dat_upl_dph
        root << (Ox::Element.new('PrijatDokl') << prijat_dokl) if prijat_dokl
        root << (Ox::Element.new('VarSym') << var_sym) if var_sym
        root << (Ox::Element.new('ParSym') << par_sym) if par_sym
        root << (Ox::Element.new('Pokl') << pokl) if pokl
        root << (Ox::Element.new('PrKont') << pr_kont) if pr_kont
        root << (Ox::Element.new('Cleneni') << cleneni) if cleneni
        root << (Ox::Element.new('Stred') << stred) if stred
        root << (Ox::Element.new('Zakazka') << zakazka) if zakazka
        root << (Ox::Element.new('Cinnost') << cinnost) if cinnost
        root << (Ox::Element.new('SSazba') << s_sazba) if s_sazba
        root << (Ox::Element.new('ZSazba') << z_sazba) if z_sazba
        root << (Ox::Element.new('StatMOSS') << stat_moss) if stat_moss
        root << (Ox::Element.new('Pozn') << pozn) if pozn
        root << (Ox::Element.new('DRada') << d_rada) if d_rada
        root << (Ox::Element.new('DCislo') << d_cislo) if d_cislo
        root << (Ox::Element.new('Vyst') << vyst) if vyst
        root << (Ox::Element.new('TypDokl') << typ_dokl) if typ_dokl
        root << (Ox::Element.new('ZjednD') << zjedn_d) if zjedn_d
        root << (Ox::Element.new('Celkem') << celkem) if celkem
        root << EETType.new(eet, 'EET').builder if eet
        root << DokladFirmaType.new(adresa, 'Adresa').builder if adresa
        root << Valuty.new(valuty, 'Valuty').builder if valuty
        root << MojeFirmaType.new(moje_firma, 'MojeFirma').builder if moje_firma
        root << Vlajky.new(vlajky, 'Vlajky').builder if vlajky
        root << SouhrnDPHType.new(souhrn_dph, 'SouhrnDPH').builder if souhrn_dph

        if seznam_norm_polozek
          element = Ox::Element.new('SeznamNormPolozek')
          seznam_norm_polozek.each { |i| element << NormPolozUDType.new(i, 'NormPolozka').builder }
          root << element
        end

        if seznam_rozuct_polozek
          element = Ox::Element.new('SeznamRozuctPolozek')
          seznam_rozuct_polozek.each { |i| element << RozuctPolozUDType.new(i, 'RozuctPolozka').builder }
          root << element
        end

        if dokumenty
          element = Ox::Element.new('Dokumenty')
          dokumenty.map { |i| Ox::Element.new('Dokument') << i }.each { |i| element << i }
          root << element
        end

        root
      end
    end
  end
end