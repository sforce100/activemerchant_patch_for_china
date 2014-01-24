require 'open-uri'
require "rexml/document"
require 'active_merchant/billing/integrations/helper'
module ActiveMerchant
  module Billing
    module Integrations
      module AlipayWap
        class Helper
          include REXML
          ALIPAY_WAP_TOCKEN_SERVICE = 'alipay.wap.trade.create.direct'
          ALIPAY_WAP_TRASACTION_SERVICE = 'alipay.wap.auth.authAndExecute'
          ALIPAY_WAP_VERSION = "2.0"
          XML_PARAMS = [:subject, :out_trade_no, :total_fee, :seller_account_name, :call_back_url, :notify_url, :out_user, :merchant_url, :pay_expire]
          def self.query_params!(options, key,token = "")          
            _params = {
                        req_data:       token.present? ? exec_data(token) : req_data(options),
                        service:        token.present? ? ALIPAY_WAP_TRASACTION_SERVICE : ALIPAY_WAP_TOCKEN_SERVICE,
                        sec_id:         "MD5",
                        partner:        options[:partner],
                        req_id:         "#{Time.now.to_i}",
                        format:         "xml",
                        _input_charset: "utf-8",
                        v:              ALIPAY_WAP_VERSION
                      }
            _params.merge!(sign(_params,key))
          end

          def self.get_token options,key,service_url
            encoded_query = Helper.query_params!(options,key).map{|key, value| "#{key}=#{CGI.escape(value)}" }.join("&")
            res = open("#{service_url}#{encoded_query}")          
            resolve_xml res
          end

          private
          def self.resolve_xml res
            xml = res.string.split("&").collect{|v|URI.decode(v.gsub('res_data=','')) if v.include?("res_data")}.compact.first
            Document.new(xml).get_elements("direct_trade_create_res").first.get_elements("request_token").first.text
          end

          def self.exec_data token
            "<auth_and_execute_req><request_token>#{token}</request_token></auth_and_execute_req>"
          end

          def self.req_data options
            str = "<direct_trade_create_req>"
            XML_PARAMS.each do |v|
              str += "<#{v}>" + options[v]+ "</#{v}>" if options[v].present?
            end
            str += "</direct_trade_create_req>"
          end

          def self.sign options,key
            hash = delete_fields_and_empty options
            {sign: Digest::MD5.hexdigest((Hash[hash.sort].map{|k,v| "#{k}=" + "#{v}"}).join("&") + key)}
          end

          def self.delete_fields_and_empty options
            ["sec_id","sign"].each {|v| options.delete(v)}
            options.map{|k,v| options.delete(k) if v.blank?}
            options
          end          
        end
      end
    end
  end
end