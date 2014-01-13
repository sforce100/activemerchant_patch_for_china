require File.dirname(__FILE__) + '/alipay/helper.rb'
require File.dirname(__FILE__) + '/alipay/notification.rb'
require File.dirname(__FILE__) + '/alipay/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        extend self

        mattr_accessor :service_url
        self.service_url = 'https://mapi.alipay.com/gateway.do?'

        def notification(post)
          Notification.new(post)
        end
        
        def return(query_string)
          Return.new(query_string)
        end

        def execute_uri options,key
          "#{service_url}#{buidle_uri options,key}"
        end

        private
        def buidle_uri options,key
          ActiveMerchant::Billing::Integrations::Alipay::Helper.KEY = key
          helper = Helper.new(options["out_trade_no"],options["partner"],{})
          helper.query_params(options)
          helper.sign
          helper.fields.sort.collect{|s|s[0]+"="+CGI.unescape(s[1])}.join("&")
        end
      end
    end
  end
end
