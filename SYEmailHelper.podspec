Pod::Spec.new do |s|
  s.ios.deployment_target  = '8.0'
  s.name     = 'SYEmailHelper'
  s.version  = '1.0'
  s.license  = 'Custom'
  s.summary  = 'Detect installed email clients and allow the user to choose one when sending an email'
  s.homepage = 'https://github.com/dvkch/SYEmailHelper'
  s.author   = { 'Stan Chevallier' => 'contact@stanislaschevallier.fr' }
  s.source   = { :git => 'https://github.com/dvkch/SYEmailHelper.git', :tag => s.version.to_s }
  s.source_files = 'SYEmailHelper/*.{h,m}'
  s.requires_arc = true
  s.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }
  s.module_name = "SYEmailHelper"
end
