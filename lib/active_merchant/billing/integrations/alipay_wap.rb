require File.dirname(__FILE__) + '/alipay_wap/helper.rb'
require File.dirname(__FILE__) + '/alipay_wap/notification.rb'
require File.dirname(__FILE__) + '/alipay_wap/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module AlipayWap
        extend self
        mattr_accessor :service_url
        self.service_url = 'http://wappaygw.alipay.com/service/rest.htm?'

        def notification(post,options={})
          Notification.new(post)
        end

        def return(query_string,options={})
          Return.new(query_string,options)
        end

        def execute_uri options,key
          token = Helper.get_token options,key,service_url
          encoded_query = Helper.query_params!(options,key,token).map{|key, value| "#{key}=#{CGI.escape(value)}" }.join("&")
          "#{service_url}""#{encoded_query}"
        end
      end
    end
  end
end
