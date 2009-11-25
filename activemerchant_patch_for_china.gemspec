# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activemerchant_patch_for_china}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Huang"]
  s.date = %q{2009-11-25}
  s.description = %q{A rails plugin to add an active_merchant patch for china online payment platform}
  s.email = %q{flyerhzm@gmail.com}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "activemerchant_patch_for_china.gemspec",
     "lib/active_merchant/billing/integrations/alipay.rb",
     "lib/active_merchant/billing/integrations/alipay/helper.rb",
     "lib/active_merchant/billing/integrations/alipay/notification.rb",
     "lib/active_merchant/billing/integrations/alipay/return.rb",
     "lib/active_merchant/billing/integrations/alipay/sign.rb",
     "lib/active_merchant/billing/integrations/bill99.rb",
     "lib/active_merchant/billing/integrations/bill99/helper.rb",
     "lib/active_merchant/billing/integrations/bill99/return.rb",
     "lib/active_merchant/billing/integrations/tenpay.rb",
     "lib/active_merchant/billing/integrations/tenpay/helper.rb",
     "lib/active_merchant/billing/integrations/tenpay/return.rb",
     "lib/activemerchant_patch_for_china.rb",
     "lib/integrations_helper.rb",
     "rails/init.rb",
     "test/activemerchant_patch_for_china_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/flyerhzm/activemerchant_patch_for_china}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A rails plugin to add an active_merchant patch for china online payment platform}
  s.test_files = [
    "test/activemerchant_patch_for_china_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemerchant>, [">= 1.4.2"])
    else
      s.add_dependency(%q<activemerchant>, [">= 1.4.2"])
    end
  else
    s.add_dependency(%q<activemerchant>, [">= 1.4.2"])
  end
end

