require 'spec_helper'

describe ActiveMerchant::Billing::Integrations::AlipayWap do
  context 'fields' do

    hash = {
      partner: "2088201123456", subject: "test", out_trade_no: "123456",
      total_fee: "0.01", seller_account_name: "test@xiangrikui.com",
      call_back_url: "www.qq.com",notify_url: "www.alipay.com",
      out_user: "5510", merchant_url: "www.baidu.com", pay_expire: "86400"
    }
    ActiveMerchant::Billing::Integrations::AlipayWap.methods
    a = ActiveMerchant::Billing::Integrations::AlipayWap.get_token_uri(hash,"key")
    a.include? ("http://wappaygw.alipay.com/service/rest.htm?").should be_true
  end
end