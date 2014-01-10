
# ActivemerchantPatchForChina
require 'activemerchant_patch_for_china/version'
require 'active_merchant/billing/integrations/notification'
require 'active_merchant/billing/integrations/helper'
require 'active_merchant/billing/integrations/return'

# require 'active_merchant/billing/integrations/alipay'
require 'active_merchant/billing/integrations/alipay/notification'
require 'active_merchant/billing/integrations/alipay/helper'
require 'active_merchant/billing/integrations/alipay/return'
require 'active_merchant/billing/integrations/alipay/sign'


require 'active_merchant/billing/integrations/alipay_wap/helper'
require 'active_merchant/billing/integrations/alipay_wap/notification'
require 'active_merchant/billing/integrations/alipay_wap/return'

require 'active_merchant/billing/integrations/bill99'
require 'active_merchant/billing/integrations/bill99_card'
require 'active_merchant/billing/integrations/tenpay'
require 'active_merchant/billing/integrations/pay19'
require 'active_merchant/billing/integrations/yeepay'

require 'integrations_helper'
