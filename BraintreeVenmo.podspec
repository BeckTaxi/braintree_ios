Pod::Spec.new do |s|
  s.name             = "BraintreeVenmo"
  s.version          = "4.28.0"
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

  s.default_subspecs = %w[Venmo]

  s.subspec "Venmo" do |s|
    s.source_files = "BraintreeVenmo/**/*.{h,m}"
    s.public_header_files = "BraintreeVenmo/Public/*.h"
    s.dependency "BraintreeCore"
    s.dependency "BraintreePayPal/PayPalDataCollector"
  end

end
