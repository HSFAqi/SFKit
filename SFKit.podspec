#
# Be sure to run `pod lib lint SFKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SFKit'
  s.version          = '0.1.1'
  s.summary          = '使用高效的自定义UI控件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HSFAqi/SFKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HSFAqi' => 'huangsf_ios@sina.com' }
  s.source           = { :git => 'https://github.com/HSFAqi/SFKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'SFKit/Classes/**/*'
  
   s.resource_bundles = {
     'SFKit' => ['SFKit/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  
  # MARK: - subspec
  
  s.subspec 'Extension' do |ss|
      ss.source_files = 'SFKit/Classes/Extension/**/*'
      ss.subspec 'UIKit' do |sss|
          sss.source_files = 'SFKit/Classes/Extension/UIKit/*'
      end
      ss.subspec 'Foundation' do |sss|
          sss.source_files = 'SFKit/Classes/Extension/Foundation/*'
      end
  end

  s.subspec 'Base' do |ss|
      ss.source_files = 'SFKit/Classes/Base/**/*'
  end
  
  s.subspec 'CollectionView' do |ss|
      ss.source_files = 'SFKit/Classes/CollectionView/**/*'
  end
  
  
end
