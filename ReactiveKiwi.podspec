#
# Be sure to run `pod lib lint ReactiveKiwi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ReactiveKiwi"
  s.version          = "0.2.0"
  s.summary          = "A RACSignal extension to test signals in Kiwi BDD framework"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       It allows you to test reactive signals without tedious subscribeNext
                       DESC

  s.homepage         = "https://github.com/haifengkao/ReactiveKiwi"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hai Feng Kao" => "haifeng@cocoaspice.in" }
  s.source           = { :git => "https://github.com/haifengkao/ReactiveKiwi.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ReactiveKiwi/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ReactiveKiwi' => ['ReactiveKiwi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.framework = 'XCTest'
  s.dependency 'ReactiveCocoa'
  s.dependency 'Kiwi'
end
