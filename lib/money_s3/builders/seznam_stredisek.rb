require 'money_s3/builders/base_builder'
require 'money_s3/builders/stredisko'

module MoneyS3
  module Builders
    class SeznamStredisek
      include BaseBuilder

      def builder
        root = Ox::Element.new(name)
        if data.respond_to? :attributes
          data.attributes.each { |k, v| root[k] = v }
        end

        if data.key? :stredisko
          data[:stredisko].each { |i| root << Stredisko.new('Stredisko', i).builder }
        end

        root
      end
    end
  end
end