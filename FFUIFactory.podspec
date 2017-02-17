Pod::Spec.new do |s|
  s.name             = 'FFUIFactory'
  s.version          = '1.0.0'
  s.summary          = 'Fast manager tableView, A Cocoa / Objective-C wrapper around UITableView'
  s.homepage         = 'https://github.com/liubin303/FFUIFactory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liubin303' => '273631976@qq.com' }
  s.source           = { :git => 'https://github.com/liubin303/FFUIFactory.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files     = 'FFUIFactory/*.{h,m}'
  s.requires_arc     = true

end