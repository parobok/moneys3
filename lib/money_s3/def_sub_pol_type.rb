require 'money_s3/base_element'
require 'money_s3/pol_skl_dokl_type'

module MoneyS3
  class DefSubPolType
    include BaseElement

    def mj_na_sadu
      at :MJNaSadu
    end

    def polozka
      submodel_at(PolSklDoklType, :Polozka)
    end

    def to_h
      { mj_na_sadu: mj_na_sadu,
        polozka: polozka.to_h
      }.delete_if { |k, v| v.nil? || v.empty? }
    end
  end
end
