require File.dirname(__FILE__) + '/alipay_wap/helper.rb'
require File.dirname(__FILE__) + '/alipay_wap/notification.rb'
require File.dirname(__FILE__) + '/alipay_wap/return.rb'
require 'httparty'
require 'nokogiri'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module AlipayWap
        mattr_accessor :service_url
        self.service_url = 'http://wappaygw.alipay.com/service/rest.htm?'

        def self.notification(post,options={})
          Notification.new(post)
        end

        def self.return(query_string,options={})
          Return.new(query_string,options)
        end

        def self.execute_uri options,key
          token = get_token options,key
          encoded_query = Helper.query_params!(options,key,token)
          service_url + encoded_query
        end 

        private 
        def self.get_token options,key
          encoded_query = Helper.query_params!(options,key).map{|key, value| "#{key}=#{value}" }.join("&")
          resutl = HTTParty.get(service_url + encoded_query)
          resolve_xml resutl
        end

        def resolve_xml str
          xml = str.body.split("&").collect{|v|URI.decode(v.gsub('res_data=','')) if v.include?("res_data")}.compact.first
          doc = Nokogiri::XML(xml)
          hash = {}
          doc.root.children.each do |v|
             hash.merge!({"#{v.name}"=> v.text})
          end
          hash["request_token"]
        end
      end
    end
  end
end
