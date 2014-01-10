require 'net/http'
require 'active_merchant/billing/integrations/alipay_wap/sign'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module AlipayWap
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          include Sign

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
