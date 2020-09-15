Pod::Spec.new do |s|
  s.name         = "NDEtc_Swift"
  s.version      = "0.0.1"
  s.summary      = "An utilities library will be classified in the future."
  s.description  = <<-DESC
  NDEtc_Swift is an utilities library will be classified in the future.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-etc-swift.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
  #s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-etc-swift.git", :tag => "Pod-#{s.version}" }
  
  s.source_files  = "#{s.name}/**/*.{h,m,mm,swift}"
  #s.public_header_files = '#{s.name}/**/*.h'
  
  s.dependency 'NDEtc', '~> 0.0.1'
  s.dependency 'NDLog_Swift', '~> 0.0.5'
  s.dependency 'TagListView', '~> 1.0'
end
