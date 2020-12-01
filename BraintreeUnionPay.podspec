Pod::Spec.new do |s|
  s.name             = "BraintreeUnionPay"
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

  s.default_subspecs = %w[UnionPay]

  s.subspec "UnionPay" do |s|
    s.source_files  = "BraintreeUnionPay/**/*.{h,m}"
    s.public_header_files = "BraintreeUnionPay/Public/*.h"
    s.frameworks = "UIKit"
    s.dependency "BraintreeCard"
    s.dependency "BraintreeCore"
  end

end
