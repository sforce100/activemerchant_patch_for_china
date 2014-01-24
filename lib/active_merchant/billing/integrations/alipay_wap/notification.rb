require 'net/http'
require 'active_merchant/billing/integrations/alipay_wap/sign'
require "rexml/document"

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module AlipayWap
        class Notification < ActiveMerchant::Billing::Integrations::Notification
        include Sign
        include REXML

        def initialize(params)
          resolve_xml params
        end

        def resolve_xml params
          Document.new(params["notify_data"]).get_elements("notify").first.each_child do |v|
            self.class_eval <<-EOF
              def #{v.name}
                '#{v.text}'
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
