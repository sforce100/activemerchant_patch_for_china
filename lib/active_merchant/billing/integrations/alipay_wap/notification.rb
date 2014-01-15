require 'net/http'
require 'active_merchant/billing/integrations/alipay_wap/sign'
require 'nokogiri'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module AlipayWap
        class Notification < ActiveMerchant::Billing::Integrations::Notification
        include Sign

        def initialize(params)
          resolve_xml params
        end

        def resolve_xml params
          Nokogiri::XML(params["notify_data"]).root.children.each do |v|
            self.class_eval <<-EOF
              def #{v.name}
                #{v.text}
              end
            EOF
          end
        end

          private
          # Take the posted data and move the relevant data into a hash
          def parse(post)
            @raw = post
            for line in post.split('&')
              key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
              params[key] = CGI.unescape(value || '')
            end
          end
        end
      end
    end
  end
end
