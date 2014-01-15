require 'spec_helper'

describe ActiveMerchant::Billing::Integrations::AlipayWap do
  context 'fields' do

    hash = {:subject=>"test", :out_trade_no=>"138968323980539", :total_fee=>"0.01", :payment_type=>"2", :seller_email=>"pay@xiangrikui.com", :seller_account_name=>"pay@xiangrikui.com", :_input_charset=>"utf-8", :service=>"create_direct_pay_by_user", :partner=>"2088201962733496", :return_url=>nil, :call_back_url=>"www.baidu.com", :merchant_url=>"www.404.com", :pay_expire=>nil, :notify_url=>"http://pay.xiangrikui.com:3000/payment/transaction/alipay/notify"}

    a = ActiveMerchant::Billing::Integrations::AlipayWap.execute_uri(hash,"rjllq1mf24igskb9y8jaeko6pucsc7g9")
    p a
  end
end