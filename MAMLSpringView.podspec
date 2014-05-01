#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "MAMLSpringView"
  s.version          = "0.1.0"
  s.summary          = "A circular view with a label that changes text and color and springs out and in when touched."
  s.description      = <<-DESC
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1"
  s.license          = 'MIT'
  s.author           = { "Matthew Loseke" => "mloseke@gmail.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mattloseke'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'pop'
end
