#
# Be sure to run `pod lib lint AppVersionMonitor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AppVersionMonitor"
  s.version          = "1.1.0"
  s.summary          = "Monitor iOS app version easily."

  s.description      = "Monitor iOS app version easily!"
  s.homepage         = "https://github.com/eure/AppVersionMonitor"
  s.license          = 'MIT'
  s.author           = { "muukii" => "m@muukii.me" }
  s.source           = { :git => "https://github.com/eure/AppVersionMonitor.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
