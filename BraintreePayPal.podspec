Pod::Spec.new do |s|
  s.name             = "BraintreePayPal"
  s.version          = "4.30.2"
  s.summary          = "Braintree v.zero: A modern foundation for accepting payments"
  s.description      = <<-DESC
                       Braintree is a full-stack payments platform for developers

                       This CocoaPod will help you accept payments in your iOS app.

                       Check out our development portal at https://developers.braintreepayments.com.
  DESC
  s.homepage         = "https://www.braintreepayments.com/how-braintree-works"
  s.documentation_url = "https://developers.braintreepayments.com/ios/start/hello-client"
  s.screenshots      = "https://raw.githubusercontent.com/braintree/braintree_ios/master/Docs/screenshot.png"
  s.license          = "MIT"
  s.author           = { "Braintree" => "code@getbraintree.com" }
  s.source           = { :git => "https://github.com/braintree/braintree_ios.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/braintree"

  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.compiler_flags = "-Wall -Werror -Wextra"

  s.default_subspecs = %w[PayPal]

  s.subspec "PayPal" do |s|
    s.source_files = "BraintreePayPal/*.{h,m}", "BraintreePayPal/Public/*.h"
    s.public_header_files = "BraintreePayPal/Public/*.h"
    s.dependency "BraintreeCore"
    s.dependency "BraintreePayPal/PayPalOneTouch"
  end

  s.subspec "PayPalOneTouch" do |s|
    s.source_files = "BraintreePayPal/PayPalOneTouch/**/*.{h,m}"
    s.public_header_files = "BraintreePayPal/PayPalOneTouch/Public/*.h"
    s.frameworks = "UIKit"
    s.weak_frameworks = "SafariServices"
    s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC -lc++" }
    s.dependency "BraintreeCore"
    s.dependency "BraintreePayPal/PayPalDataCollector"
    s.dependency "BraintreePayPal/PayPalUtils"
  end

  s.subspec "PayPalDataCollector" do |s|
    s.source_files = "BraintreePayPal/PayPalDataCollector/**/*.{h,m}"
    s.public_header_files = "BraintreePayPal/PayPalDataCollector/Public/*.h", "BraintreePayPal/PayPalDataCollector/Risk/*.h"
    s.frameworks = "MessageUI", "SystemConfiguration", "CoreLocation", "UIKit"
    s.vendored_library = "BraintreePayPal/PayPalDataCollector/Risk/libPPRiskMagnesOC.a"
    s.dependency "BraintreeCore"
    s.dependency "BraintreePayPal/PayPalUtils"
  end

  s.subspec "PayPalUtils" do |s|
    s.source_files = "BraintreePayPal/PayPalUtils/**/*.{h,m}"
    s.public_header_files = "BraintreePayPal/PayPalUtils/Public/*.h"
    s.frameworks = "MessageUI", "SystemConfiguration", "CoreLocation", "UIKit"
  end
end
