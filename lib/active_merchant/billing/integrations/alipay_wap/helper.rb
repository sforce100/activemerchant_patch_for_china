require 'active_merchant/billing/integrations/helper'
module ActiveMerchant
  module Billing
    module Integrations
      module AlipayWap
        class Helper
          ALIPAY_WAP_TOCKEN_SERVICE = 'alipay.wap.trade.create.direct'
          ALIPAY_WAP_TRASACTION_SERVICE = 'alipay.wap.auth.authAndExecute'
          ALIPAY_WAP_VERSION = "2.0"
          
          def self.query_params!(options, key,token = "")          
            _params = {
                        req_data:       token.present? ? buidle_exec_data(token) : buidle_req_data(options),
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

          def self.buidle_exec_data token
            "<auth_and_execute_req><request_token>#{token}</request_token></auth_and_execute_req>"
          end

          def self.buidle_req_data options
            str = "<direct_trade_create_req>"
            [:subject, :out_trade_no, :total_fee, :seller_account_name, :call_back_url, :notify_url, :out_user, :merchant_url, :pay_expire].each do |v|
              str += "<#{v}>" + options[v]+ "</#{v}>" if options[v].present?
            end
            str += "</direct_trade_create_req>"
          end

          def self.sign options,key
            delete_fields_or_empty options
            {sign: Digest::MD5.hexdigest((Hash[options.sort].map{|k,v| "#{k}=" + "#{v}"}).join("&") + key)}
          end

          def self.delete_fields_or_empty options
            ["sec_id","sign"].each {|v| options.delete(v)}
            options.map{|k,v| options.delete(k) if v.blank?}
            options
          end
          
        end
      end
    end
  end
end