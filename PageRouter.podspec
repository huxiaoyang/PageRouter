#
#  Be sure to run `pod spec lint PageRouter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = 'PageRouter'
  s.summary      = 'A page router with swift project'
  s.version      = '0.0.3'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'huxiaoyang' => 'yohuyang@iCloud.com' }
  s.homepage     = 'https://github.com/huxiaoyang/PageRouter'
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/huxiaoyang/PageRouter.git', :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'Classes/*.swift'


end
