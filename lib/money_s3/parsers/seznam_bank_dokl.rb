require 'money_s3/parsers/base_parser'
require 'money_s3/parsers/bank_dokl'

module MoneyS3
  module Parsers
    class SeznamBankDokl
      include BaseParser

      def bank_dokl
        array_of_at(BankDokl, ['BankDokl'])
      end

      def to_h_with_attrs
        hash = HashWithAttributes.new({}, attributes)

        hash[:bank_dokl] = bank_dokl.map(&:to_h_with_attrs) if has? 'BankDokl'

        hash
      end
    end
  end
end