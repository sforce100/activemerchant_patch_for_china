require 'spec_helper'

describe ActiveMerchant::Billing::Integrations::AlipayWap do
  context 'fields' do

    hash = {
      partner: "2088201962733496", subject: "test", out_trade_no: "123456",
      total_fee: "0.01", seller_account_name: "pay@xiangrikui.com",
      call_back_url: "www.qq.com",notify_url: "www.alipay.com",
      out_user: "5510", merchant_url: "www.baidu.com", pay_expire: "86400"
    }
  
    a = ActiveMerchant::Billing::Integrations::AlipayWap.execute_uri(hash,"rjllq1mf24igskb9y8jaeko6pucsc7g9")
    # a.include? ("http://wappaygw.alipay.com/service/rest.htm?").should be_true
  end
end